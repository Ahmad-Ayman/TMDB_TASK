import 'package:flutter/material.dart';
import 'package:tmdbtask/core/utils/helpers/extensions.dart';

import '../../../../core/utils/components/custom_image.dart';
import '../../../../core/utils/components/custom_text.dart';
import '../../../../core/utils/helpers/assetsManager.dart';

class CastListItem extends StatelessWidget {
  const CastListItem({super.key, this.profilePath, required this.name});
  final String? profilePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          if (profilePath != null) ...[
            CustomImage(imagePath: profilePath!, isCircleImage: true)
          ] else ...[
            const CircleAvatar(
              backgroundImage: AssetImage(AssetsManager.noImageAsset),
              radius: 60,
            ),
          ],
          8.ph,
          SizedBox(
            width: 100,
            child: CustomText(
              text: name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
