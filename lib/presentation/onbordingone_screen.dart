import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'package:mealmate/main.dart';

class OnbordingoneScreen extends StatefulWidget {
  const OnbordingoneScreen({Key? key}) : super(key: key);

  @override
  _OnbordingoneScreenState createState() => _OnbordingoneScreenState();
}

class _OnbordingoneScreenState extends State<OnbordingoneScreen> {

  changeGoalforDatabase(goal){
    if (goal=="Burn away my fat"){
      selectedGoal = "Weight loss";
    }else if (goal=="Just maintain my weight"){
      selectedGoal = "Maintenance";
    }else if(goal=="Gain some huge muscles"){
      selectedGoal = "Weight gain";
    }
    // print(selectedGoal);
  }

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
                      child: Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowLeft,
                            height: 12.v,
                            width: 18.h,
                            onTap: () {
                              onTapImgArrowLeft(context);
                            }),
                        Container(
                            height: 9.v,
                            width: 47.h,
                            margin: EdgeInsets.only(
                                left: 14.h, top: 2.v, bottom: 1.v),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(4.h))),
                        Container(
                            height: 9.v,
                            width: 47.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 2.v, bottom: 1.v),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(4.h))),
                        Container(
                            height: 9.v,
                            width: 47.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 2.v, bottom: 1.v),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(4.h))),
                        Container(
                            height: 9.v,
                            width: 47.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 2.v, bottom: 1.v),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(4.h))),
                        Container(
                            height: 9.v,
                            width: 47.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 2.v, bottom: 1.v),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(4.h)))
                      ]))),
              SizedBox(height: 64.v),
              Text("Help us know you better!", style: theme.textTheme.titleLarge),
              SizedBox(height: 44.v),
              Container(
                width: 335.h,
                margin: EdgeInsets.only(left: 22.h, right: 23.h),
                child: Text(
                  "Select the goal you want to achieve and we'll get started right away",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineLargeRegular,
                ),
              ),
              SizedBox(height: 33.v),
              _buildCategories(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildNEXT(context),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    const double boxSpacing = 20.0;
    return Column(
      children: [
        _buildGoalButton("Burn away my fat", EdgeInsets.symmetric(horizontal: 85.h, vertical: 50.v)),
        SizedBox(height: boxSpacing),
        _buildGoalButton("Just maintain my weight", EdgeInsets.symmetric(horizontal: 50.h, vertical: 50.v)),
        SizedBox(height: boxSpacing),
        _buildGoalButton("Gain some huge muscles", EdgeInsets.symmetric(horizontal: 50.h, vertical: 50.v)),
      ],
    );
  }

  Widget _buildGoalButton(String goal, EdgeInsets padding) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedGoal = goal;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: selectedGoal == goal ? Colors.green : null,
      ),
      child: Text(
        goal,
        style: CustomTextStyles.headlineLargeRegular,

      ),
    );
  }


  Widget _buildNEXT(BuildContext context) {
    return CustomElevatedButton(
      text: "NEXT",
      margin: EdgeInsets.only(left: 25.h, right: 31.h, bottom: 50.v),
      onPressed: () {
        onTapNEXT(context);
        setState(() {
          changeGoalforDatabase(selectedGoal);
        });
      },
    );
  }


  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNEXT(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.onbordingtwoScreen,
      arguments: {'selectedGoal': selectedGoal},
    );
  }
}
