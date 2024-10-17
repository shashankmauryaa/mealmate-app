import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'package:mealmate/theme/theme_helper.dart';
import 'package:mealmate/main.dart';

class OnbordingthreeScreen extends StatefulWidget {
  const OnbordingthreeScreen({Key? key}) : super(key: key);

  @override
  _OnbordingthreeScreenState createState() => _OnbordingthreeScreenState();
}

class _OnbordingthreeScreenState extends State<OnbordingthreeScreen> {

  List<String> days = List.generate(31, (index) => (index + 1).toString());
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  List<String> years = List.generate(100, (index) => (2024 - index).toString());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 18.v),
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
                  padding: EdgeInsets.only(left: 23.h, right: 76.h),
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
                          left: 14.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.blueGray100,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      Container(
                        height: 9.v,
                        width: 47.h,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.blueGray100,
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 56.v),
              Text("Next step", style: theme.textTheme.titleLarge),
              SizedBox(height: 65.v),
              SizedBox(
                height: 90.v,
                width: 260.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "What is your date of birth?",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.headlineLargeRegular,
                  ),
                ),
              ),
              SizedBox(height: 65.v),
              Row(
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
                      value: selectedDay,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        setState(() {
                          selectedDay = value!;
                        });
                      },
                      items: days.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: days.indexOf(value).toString(), // Assign unique numerical values
                          child: Text(value, style: theme.textTheme.headlineLarge,),
                        );
                      }).toList(),
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
                      value: selectedMonth,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        setState(() {
                          selectedMonth = value!;
                        });
                      },
                      items: months.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: months.indexOf(value).toString(), // Assign unique numerical values
                          child: Text(value, style: theme.textTheme.headlineLarge,),
                        );
                      }).toList(),
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
                      value: selectedYear,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        setState(() {
                          selectedYear = value!;
                        });
                      },
                      items: years.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: years.indexOf(value).toString(), // Assign unique numerical values
                          child: Text(value, style: theme.textTheme.headlineLarge,),
                        );
                      }).toList(),
                    ),
                  ),
                  Spacer(flex: 20),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
      text: "NEXT",
      margin: EdgeInsets.only(left: 28.h, right: 28.h, bottom: 49.v),
      onPressed: () {
        onTapNextButton(context);
      },
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the onbordingfourScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.onbordingfourScreen,
      arguments: {'day': selectedDay, 'month': selectedMonth, 'year': selectedYear,},
    );
  }
}
