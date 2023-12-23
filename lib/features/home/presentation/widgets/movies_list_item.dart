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
      required this.text,
      required this.imageLink,
      required this.movie});
  final String text;
  final String imageLink;
  final MovieDataModel movie;

  @override
  Widget build(BuildContext context) {
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
                imagePath: imageLink,
              )),
          8.ph,
          CustomText(
            text: '$text',
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
