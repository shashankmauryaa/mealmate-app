import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'user_dashboard_screen.dart';  // getting doctors profile selected selected

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {

  final _firestore = FirebaseFirestore.instance;
  String qualifications = '', regno = '', patients = '', experience = '', about = '';

  @override
  void initState() {
    super.initState();
    getDoctorDetails();
  }

  void getDoctorDetails() async {
    final docDetails = await _firestore.collection('doctors').where('doctor name',isEqualTo:selectedDoctor).get();
    for(var details in docDetails.docs){
      qualifications = details.data()['qualifications'];
      regno = details.data()['regno'];
      patients = details.data()['number of patients'];
      experience = details.data()['experience'];
      about = details.data()['about'];
    }
    setState(() {
      _buildBody(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: _buildBody(context)),
        bottomNavigationBar: _buildBookNow(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 30.v),
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 12.v,
            width: 18.h,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 7.h),
            onTap: () {
              onTapImgArrowLeft(context);
            },
          ),
          SizedBox(height: 20.v),
          Text("Doctor Details", style: theme.textTheme.displaySmall),
          SizedBox(height: 30.v),
          CustomImageView(
            imagePath: ImageConstant.docimg,
            height: 137.v,
            width: 160.h,
            radius: BorderRadius.circular(53.h),
          ),
          SizedBox(height: 30.v),
          Text(selectedDoctor, style: theme.textTheme.displaySmall),
          SizedBox(height: 30.v),
          Container(
            width: 331.h,
            margin: EdgeInsets.only(left: 43.h, right: 37.h),
            child: Text(
              qualifications,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleLargeBlack90003,
            ),
          ),
          SizedBox(height: 30.v),
          Row(
            children: [
              SizedBox(width: 120.v),
              Text("Registration Number: ", style: theme.textTheme.titleLarge),
              Text(regno, style: theme.textTheme.titleLarge),
            ],
          ),
          SizedBox(height: 30.v),
          _buildRecentOrders(context),
          SizedBox(height: 30.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 9.h),
              child: Text("About Doctor", style: theme.textTheme.titleLarge),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(about, style: CustomTextStyles.titleLargeBlack90003),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrders(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDoctorReviews(context, ratingText: "Patients", ratingValue: patients),
        _buildDoctorReviews(context, ratingText: "Experience", ratingValue: experience),
        _buildDoctorReviews(context, ratingText: "Rating", ratingValue: "4.5/5"),
      ],
    );
  }

  Widget _buildBookNow(BuildContext context) {
    return CustomElevatedButton(
      height: 51.v,
      text: "Book Now",
      margin: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 32.v),
      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
      buttonTextStyle: CustomTextStyles.headlineSmallOnPrimaryContainer,
      onPressed: () {
        onTapBookNow(context);
      },
    );
  }

  Widget _buildDoctorReviews(BuildContext context, {required String ratingText, required String ratingValue}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.blueGray100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder31,
      ),
      child: Container(
        height: 105.v,
        width: 130.h,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.v),
        decoration: AppDecoration.fillBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder31,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                ratingText,
                style: CustomTextStyles.titleLargeSansSerifCollection.copyWith(color: appTheme.black90003),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.v),
                child: Text(
                  ratingValue,
                  style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90003),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapBookNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userDietDetailsScreen);
  }

  /// Navigates back to the previous screen.
  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
