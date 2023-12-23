import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdbtask/core/utils/helpers/assetsManager.dart';

import '../helpers/constants.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key, required this.imagePath, required this.isCircleImage});

  final String imagePath;
  final bool isCircleImage;

  @override
  Widget build(BuildContext context) {
    return isCircleImage
        ? CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              GeneralConstants.imageLink(image: imagePath),
            ),
            radius: 60,
          )
        : CachedNetworkImage(
            imageUrl: GeneralConstants.imageLink(image: imagePath),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) =>
                Image.asset(AssetsManager.noImageAsset),
            fit: BoxFit.fill,
            width: double.infinity,
          );
  }
}
