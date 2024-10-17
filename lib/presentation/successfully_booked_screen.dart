import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';

class SuccessfullyBookedScreen extends StatelessWidget {
  const SuccessfullyBookedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.h, vertical: 263.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text("Successfully Booked",
                          style: theme.textTheme.displaySmall),
                      SizedBox(height: 43.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgDownloadbooking,
                          height: 89.v,
                          width: 96.h),
                      SizedBox(height: 63.v),
                      CustomElevatedButton(
                          height: 51.v,
                          text: "Back to home",
                          buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                          buttonTextStyle:
                              CustomTextStyles.headlineSmallBlack90002,
                          onPressed: () {
                            onTapBackToHome(context);
                          })
                    ]))));
  }

  /// Navigates to the userDashboardScreen when the action is triggered.
  onTapBackToHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userDashboardScreen);
  }
}
