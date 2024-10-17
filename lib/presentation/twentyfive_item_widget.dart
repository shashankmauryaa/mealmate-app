import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';

// ignore: must_be_immutable
class TwentyfiveItemWidget extends StatelessWidget {
  const TwentyfiveItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 126.h,
        vertical: 43.v,
      ),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder31,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Text(
            "Lose Weight",
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
