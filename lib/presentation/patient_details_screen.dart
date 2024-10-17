import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/presentation/doctor_dashboard_screen.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'doctor_prescription_screen.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({Key? key}) : super(key: key);

  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {

  final _firestore = FirebaseFirestore.instance;
  String PatientName = '', PatientGender = '', PatientGoal = '', PatientAllergens = '', PatientHistory = '',
      PatientBirthDate = '', PatientBirthMonth = '', PatientBirthYear = '',
      PatientHeightft = '', PatientHeightinch = '', PatientWeight = '';

  @override
  void initState() {
    super.initState();
    getPatientDetails();
  }

  void getPatientDetails() async {
    final docDetails = await _firestore.collection('users').where('email',isEqualTo:selectedEmail).get();
    for(var details in docDetails.docs){
      PatientName = details.data()['username'];
      PatientGender = details.data()['gender'];
      PatientGoal = details.data()['goal'];
      PatientBirthDate = (details.data()['birth(date)']).toString();
      PatientBirthMonth = (details.data()['birth(month)']).toString();
      PatientBirthYear = (details.data()['birth(year)']).toString();
      PatientHeightft = (details.data()['height(ft)']).toString();
      PatientHeightinch = (details.data()['height(inch)']).toString();
      PatientWeight = (details.data()['weight']).toString();
      PatientHistory = details.data()['medical history'];
      PatientAllergens = details.data()['allergens'];
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
        bottomNavigationBar: _buildPrescription(context),
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
          Text("Patient Details", style: theme.textTheme.displaySmall),
          SizedBox(height: 30.v),
          CustomImageView(
            imagePath: ImageConstant.userimg,
            height: 137.v,
            width: 160.h,
            radius: BorderRadius.circular(53.h),
          ),
          SizedBox(height: 30.v),
          Text(PatientName, style: theme.textTheme.displaySmall),
          SizedBox(height: 10.v),
          Row(
            children: [
              SizedBox(width: 160.v),
              Text("Date of Birth: ", style: theme.textTheme.titleLarge),
              Text(PatientBirthDate, style: theme.textTheme.titleLarge),
              Text("/", style: theme.textTheme.titleLarge),
              Text(PatientBirthMonth, style: theme.textTheme.titleLarge),
              Text("/", style: theme.textTheme.titleLarge),
              Text(PatientBirthYear, style: theme.textTheme.titleLarge),
            ],
          ),
          SizedBox(height: 12.v),
          Row(
            children: [
              SizedBox(width: 200.v),
              Text("Height: ", style: theme.textTheme.titleLarge),
              Text(PatientHeightft, style: theme.textTheme.titleLarge),
              Text("ft ", style: theme.textTheme.titleLarge),
              Text(PatientHeightinch, style: theme.textTheme.titleLarge),
              Text("inch", style: theme.textTheme.titleLarge),
            ],
          ),
          SizedBox(height: 30.v),
          _buildRecentOrders(context),
          SizedBox(height: 30.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 9.h),
              child: Text("Medical History", style: theme.textTheme.titleLarge),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(PatientHistory, style: CustomTextStyles.titleLargeBlack90003),
            ),
          ),
          SizedBox(height: 30.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 9.h),
              child: Text("Allergens", style: theme.textTheme.titleLarge),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(PatientAllergens, style: CustomTextStyles.titleLargeBlack90003),
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
        _buildPatientReviews(context, ratingText: "Goal", ratingValue: PatientGoal),
        _buildPatientReviews(context, ratingText: "Gender", ratingValue: PatientGender),
        _buildPatientReviews(context, ratingText: "Weight(kg)", ratingValue: PatientWeight),
      ],
    );
  }

  Widget _buildPatientReviews(BuildContext context, {required String ratingText, required String ratingValue}) {
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

  Widget _buildPrescription(BuildContext context) {
    return CustomElevatedButton(
      height: 51.v,
      text: "Update Prescription",
      margin: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 32.v),
      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
      buttonTextStyle: CustomTextStyles.headlineSmallOnPrimaryContainer,
      onPressed: () {
        onTapBookNow(context);
      },
    );
  }

  onTapBookNow(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorPrescriptionScreen()));
  }

  /// Navigates back to the previous screen.
  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
