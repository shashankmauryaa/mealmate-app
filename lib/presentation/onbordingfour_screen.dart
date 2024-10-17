import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'package:mealmate/main.dart';

class OnbordingfourScreen extends StatefulWidget {
  const OnbordingfourScreen({Key? key}) : super(key: key);

  @override
  _OnbordingfourScreenState createState() => _OnbordingfourScreenState();
}

class _OnbordingfourScreenState extends State<OnbordingfourScreen> {

  List<String> feet = List.generate(8, (index) => (index + 1).toString());
  List<String> inches = List.generate(12, (index) => index.toString());
  List<String> weight = List.generate(121, (index) => (index+30).toString());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 18.v),
          decoration: BoxDecoration(
              color: appTheme.whiteA700,
              image: DecorationImage(
                  image: AssetImage(ImageConstant.imgHome2),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: 50.h),
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
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                            left: 11.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                            BorderRadius.circular(4.h)),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                            left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                            BorderRadius.circular(4.h)),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                            left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                            BorderRadius.circular(4.h)),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                            left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                            BorderRadius.circular(4.h)),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                            left: 10.h, top: 2.v, bottom: 1.v),
                        decoration: BoxDecoration(
                            color: appTheme.blueGray100,
                            borderRadius:
                            BorderRadius.circular(4.h)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 49.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                    "Great!", style: theme.textTheme.titleLarge
                ),
              ),
              SizedBox(height: 50.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "What is your height?",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineLargeRegular,
                ),
              ),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      decoration: BoxDecoration(
                          color: Color(0XFF21d066),
                          borderRadius:
                          BorderRadius.circular(30.h)
                      ),
                      child: DropdownButton<String>(
                        value: selectedFeet,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            selectedFeet = value!;
                          });
                        },
                        items: feet.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: feet.indexOf(value).toString(), // Assign unique numerical values
                            child: Text(value, style: theme.textTheme.headlineLarge,),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'feet',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    Spacer(flex: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      decoration: BoxDecoration(
                          color: Color(0XFF21d066),
                          borderRadius:
                          BorderRadius.circular(30.h)
                      ),
                      child: DropdownButton<String>(
                        value: selectedInch,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            selectedInch = value!;
                          });
                        },
                        items: inches.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: inches.indexOf(value).toString(), // Assign unique numerical values
                            child: Text(value, style: theme.textTheme.headlineLarge,),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'inches',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "What is your current weight?",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineLargeRegular,
                ),
              ),
              SizedBox(height: 40.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h, right: 120.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      decoration: BoxDecoration(
                          color: Color(0XFF21d066),
                          borderRadius:
                          BorderRadius.circular(30.h)
                      ),
                      child: DropdownButton<String>(
                        value: selectedWeight,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            selectedWeight = value!;
                          });
                        },
                        items: weight.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: weight.indexOf(value).toString(), // Assign unique numerical values
                            child: Text(value, style: theme.textTheme.headlineLarge,),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'kgs',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildNEXT(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildNEXT(BuildContext context) {
    return CustomElevatedButton(
      text: "NEXT",
      margin: EdgeInsets.only(left: 28.h, right: 28.h, bottom: 52.v),
      onPressed: () {
        onTapNEXT(context);
      },
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapNEXT(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.signupScreen,
      arguments: {'feet': selectedFeet, 'inch': selectedInch, 'weight': selectedWeight,},
    );
  }
}
