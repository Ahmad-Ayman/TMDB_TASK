import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdbtask/core/utils/components/custom_loading_indicator.dart';
import 'package:tmdbtask/core/utils/components/custom_text.dart';
import 'package:tmdbtask/core/utils/helpers/app_color.dart';
import 'package:tmdbtask/core/utils/helpers/extensions.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';
import 'package:tmdbtask/features/movie_details/presentation/widgets/cast_list_item.dart';

import '../../../../core/services/dependency_injection.dart';
import '../../../../core/utils/components/custom_divider.dart';
import '../../../../core/utils/components/custom_image.dart';
import '../../../../core/utils/components/error_widget_placeholder.dart';
import '../../../../core/utils/helpers/enums.dart';
import '../controllers/moviecast_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieData});

  final MovieDataModel movieData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            MoviecastCubit(sl())..getMovieCast(movieId: movieData.id!),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.55,
                width: MediaQuery.sizeOf(context).width,
                child: Stack(
                  children: [
                    CustomImage(
                      imagePath: movieData.posterPath!,
                      isCircleImage: false,
                    ),
                    Positioned(
                      top: 42,
                      left: 16,
                      child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: movieData.title!,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CustomText(
                      text: movieData.voteAverage!
                          .toStringAsPrecision(2)
                          .toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColor.greyColor,
                    ),
                    4.pw,
                    const Icon(
                      Icons.star,
                      color: AppColor.greyColor,
                      size: 25,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                child: Row(
                  children: [
                    const CustomText(
                      text: 'Release Date',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontColor: AppColor.greyColor,
                    ),
                    Expanded(
                      child: CustomText(
                        text: movieData.releaseDate!,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColor.greyColor,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    4.pw,
                    const Icon(
                      Icons.calendar_month,
                      color: AppColor.greyColor,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
              const Padding(
                padding: EdgeInsets.only(right: 14.0, left: 20, top: 4.0),
                child: CustomText(
                  text: 'Overview',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 20, top: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: movieData.overview!,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontColor: AppColor.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
              const Padding(
                padding: EdgeInsets.only(right: 14.0, left: 20, top: 4.0),
                child: CustomText(
                  text: 'Cast',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              4.ph,
              BlocBuilder<MoviecastCubit, MoviecastState>(
                builder: (context, state) {
                  if (state is MovieCastLoadingState) {
                    return const CustomLoadingIndicator();
                  }
                  if (state is MovieCastSuccessState) {
                    var movieCastCubit = MoviecastCubit.get(context);
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 14.0, left: 20, top: 4.0),
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CastListItem(
                                profilePath: movieCastCubit.movieCastModel!
                                    .castModelList![index].profilePath,
                                name: movieCastCubit.movieCastModel!
                                    .castModelList![index].name!);
                          },
                          itemCount: movieCastCubit
                              .movieCastModel!.castModelList!.length,
                        ),
                      ),
                    );
                  }
                  if (state is MovieCastErrorState) {
                    return ErrorWidgetPlaceHolder(
                        errorState: PageStates.error, errorMsg: state.msg);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
