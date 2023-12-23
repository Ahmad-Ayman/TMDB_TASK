import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdbtask/core/utils/components/custom_image.dart';
import 'package:tmdbtask/core/utils/helpers/extensions.dart';

import '../../../../core/utils/components/custom_text.dart';
import '../../../../core/utils/helpers/enums.dart';
import '../../data/models/movies_model.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem(
      {super.key,

      required this.movie});


  final MovieDataModel movie;

  @override
  Widget build(BuildContext context) {
    String releaseYear = movie.releaseDate != null
        ? '(${movie.releaseDate!.split('-')[0]})'
        : '';

    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.MovieDetailsScreen.name,
          extra: movie,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomImage(
                isCircleImage: false,
                imagePath: movie.posterPath??'',
              )),
          8.ph,
          CustomText(
            text: '${movie.title ?? 'Movie Name '
                    'Unavailable'} $releaseYear',
            fontSize: 12,
            fontColor: Colors.white,
            fontWeight: FontWeight.w700,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
