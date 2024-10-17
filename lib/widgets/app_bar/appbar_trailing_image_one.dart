import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTrailingImageOne extends StatelessWidget {
  AppbarTrailingImageOne({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.roundedBorder27,
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 18.v,
          width: 38.h,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            27.h,
          ),
        ),
      ),
    );
  }
}
