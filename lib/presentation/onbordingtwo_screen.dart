import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'package:mealmate/main.dart';

class OnbordingtwoScreen extends StatefulWidget {
  const OnbordingtwoScreen({Key? key}) : super(key: key);

  @override
  _OnbordingtwoScreenState createState() => _OnbordingtwoScreenState();
}

class _OnbordingtwoScreenState extends State<OnbordingtwoScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 18.v),
          decoration: BoxDecoration(
              color: appTheme.whiteA700,
              image: DecorationImage(
                  image: AssetImage(ImageConstant.imgHome2),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.h, right: 63.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 12.v,
                        width: 18.h,
                        onTap: () {
                          onTapImgArrowLeft(context);
                        },
                      ),
                      // SizedBox(width: 10.v),
                      // ElevatedButton(
                      //   onPressed: (){
                      //     Navigator.pushNamed(context, AppRoutes.onbordingoneScreen);
                      //   },
                      //   child: Container(
                      //     height: 9.v,
                      //     width: 47.h,
                      //     //margin: EdgeInsets.only(left: 14.h, top: 2.v, bottom: 1.v),
                      //     decoration: BoxDecoration(
                      //       color: theme.colorScheme.primary,
                      //       borderRadius: BorderRadius.circular(2.h),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(left: 14.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                          color: appTheme.blueGray100,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                          color: appTheme.blueGray100,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                          color: appTheme.blueGray100,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 67.v),
              Text("We’re excited to help you!", style: theme.textTheme.titleLarge),
              SizedBox(height: 46.v),
              Container(
                width: 312.h,
                margin: EdgeInsets.only(left: 33.h, right: 34.h),
                child: Text(
                  "Select your gender so we can optimize your diet plan for you",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineLargeRegular,
                ),
              ),
              SizedBox(height: 31.v),
              _buildCategories(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    const double boxSpacing = 20.0;
    return Column(
      children: [
        _buildGenderButton("Female", EdgeInsets.symmetric(horizontal: 125.h, vertical: 50.v)),
        SizedBox(height: boxSpacing),
        _buildGenderButton("Male", EdgeInsets.symmetric(horizontal: 135.h, vertical: 50.v)),
      ],
    );
  }

  Widget _buildGenderButton(String gender, EdgeInsets padding) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: selectedGender == gender ? Colors.green : null,
      ),
      child: Text(
        gender,
        style: CustomTextStyles.headlineLargeRegular,
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
      text: "NEXT",
      margin: EdgeInsets.only(left: 30.h, right: 26.h, bottom: 53.v),
      onPressed: () {
        onTapNextButton(context);
      },
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the onbordingthreeScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.onbordingthreeScreen,
      arguments: {'selectedGender': selectedGender},
    );
  }
}
