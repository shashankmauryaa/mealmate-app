import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';

class SuccessfullyPrescribedScreen extends StatelessWidget {
  const SuccessfullyPrescribedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgDownloaddoctor),
                        fit: BoxFit.cover)),
                padding:
                EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.0),
                      Text("Successfully Prescribed",
                          style: theme.textTheme.displaySmall),
                      // SizedBox(height: 20.v),
                      Spacer(),
                      CustomElevatedButton(
                          height: 50.v,
                          text: "Back to home",
                          buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                          buttonTextStyle:
                          CustomTextStyles.headlineSmallBlack90002,
                          onPressed: () {
                            onTapBackToHome(context);
                          }),
                      SizedBox(height: 30.0,)
                    ]))));
  }

  /// Navigates to the userDashboardScreen when the action is triggered.
  onTapBackToHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.doctorDashboardScreen);
  }
}
