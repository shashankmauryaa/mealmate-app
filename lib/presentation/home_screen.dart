import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.whiteA700,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgHome),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.h, vertical: 13.v),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 70.v),
                      Text("MealMate", style: CustomTextStyles.headlineLargePoppins.copyWith(
                          fontSize: 60.0,),),
                      SizedBox(height: 29.v),
                      // CustomImageView(
                      //     imagePath: ImageConstant.imgBloodPressure2x,
                      //     height: 104.v,
                      //     width: 123.h),
                      Spacer(),
                      CustomElevatedButton(
                          text: "GET STARTED",
                          buttonTextStyle:
                              CustomTextStyles.headlineSmallBlack900,
                          onPressed: () {
                            onTapGETSTARTED(context);
                          }),
                      SizedBox(height: 26.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?",
                                    style: theme.textTheme.titleLarge),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtLogIn(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 5.h),
                                        child: Text("Log in",
                                            style: CustomTextStyles
                                                .titleLargePrimary)))
                              ])),
                      SizedBox(height: 11.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDoctorSSignIn(context);
                          },
                          child: Text("Dietician’s Sign in",
                              style: CustomTextStyles.titleLargeOnPrimary)
                      ),
                      SizedBox(height: 12.v)
                    ])))));
  }

  /// Navigates to the onbordingoneScreen when the action is triggered.
  onTapGETSTARTED(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.onbordingoneScreen);
  }

  /// Navigates to the userSigninScreen when the action is triggered.
  onTapTxtLogIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userSigninScreen);
  }

  /// Navigates to the doctorSigninScreen when the action is triggered.
  onTapTxtDoctorSSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.doctorSigninScreen);
  }
}
