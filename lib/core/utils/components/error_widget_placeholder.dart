import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../helpers/enums.dart';
import '../helpers/utils_functions.dart';

class ErrorWidgetPlaceHolder extends StatelessWidget {
  ErrorWidgetPlaceHolder({
    Key? key,
    required this.errorState,
    required this.errorMsg,
  }) : super(key: key);
  final PageStates errorState;
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Lottie.asset(
            setImage(errorState),
          ),
        ),
        Text(
          errorMsg,
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
