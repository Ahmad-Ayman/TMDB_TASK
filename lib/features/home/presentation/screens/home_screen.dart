import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdbtask/core/utils/components/custom_text.dart';
import 'package:tmdbtask/core/utils/components/custom_text_field.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';
import 'package:tmdbtask/core/utils/helpers/extensions.dart';
import 'package:tmdbtask/features/home/data/models/movies_model.dart';
import 'package:tmdbtask/features/home/presentation/controllers/home_cubit.dart';

import '../../../../core/utils/components/custom_loading_indicator.dart';
import '../../../../core/utils/components/error_widget_placeholder.dart';
import '../widgets/movies_list_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  void setupScrollController(context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          homeCubit.getHomeMovies();
        }
      }
    });
  }

  int calculateCrossAxisCount(BuildContext context) {
    // Calculate the cross axis count based on the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor(); // Adjust as needed
    return crossAxisCount > 0 ? crossAxisCount : 1;
  }

  @override
  Widget build(BuildContext context) {
    // Listen to scroll events
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    setupScrollController(context);
    return Scaffold(
      backgroundColor: const Color(0xFF15141F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Find Movies, Tv Series,\nand more..',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              20.ph,
              CustomTextField(
                controller: searchController,
                borderRadius: 20,
                borderColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                hint: 'Search movies..',
                onChange: (query) {
                  homeCubit.searchMovies(query!);
                },
                onEditComplete: () {
                  homeCubit.searchMovies(searchController.text);
                },
              ),
              16.ph,
              Expanded(child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeMoviesLoadingState && state.isFirstFetch) {
                    return const CustomLoadingIndicator();
                  }
                  if (state is HomeMoviesErrorState) {
                    return ErrorWidgetPlaceHolder(
                        errorState: PageStates.error, errorMsg: state.msg);
                  }
                  List<MovieDataModel> movies = [];
                  bool isLoading = false;
                  if (state is HomeMoviesLoadingState) {
                    movies = state.oldMovies;
                    isLoading = true;
                  } else if (state is HomeMoviesSuccessState) {
                    movies = state.movies;
                  } else if (state is HomeMoviesErrorState) {
                    movies = [];
                  }
                  return GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateCrossAxisCount(context),
                      childAspectRatio: 0.55,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: movies.length + (isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < movies.length) {
                        return CustomGridItem(
                          text:
                              '${movies[index].title} (${movies[index].releaseDate!.split('-')[0]})',
                          imageLink: movies[index].posterPath!,
                          movie: movies[index],
                        );
                      } else {
                        Timer(const Duration(milliseconds: 30), () {
                          _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent);
                        });

                        return const CustomLoadingIndicator();
                      }
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
