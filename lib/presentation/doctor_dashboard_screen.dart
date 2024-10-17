import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/main.dart';
import 'package:mealmate/presentation/userprofile_item_widget.dart';
import 'package:mealmate/widgets/app_bar/appbar_leading_image.dart';
import 'package:mealmate/widgets/app_bar/appbar_trailing_image_one.dart';
import 'package:mealmate/widgets/app_bar/custom_app_bar.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'doctor_drawer.dart';

String selectedEmail = '';

class DoctorDashboardScreen extends StatefulWidget {
  const DoctorDashboardScreen({Key? key}) : super(key: key);

  @override
  _DoctorDashboardScreenState createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> {

  final _firestore = FirebaseFirestore.instance;

  Map<String, dynamic> patients = {};
  List<String> targetEmails = [];

  @override
  void initState() {
    super.initState();
    getAppointments();
  }
//firebase
  void getAppointments() async {
    final userDoc = await _firestore.collection('doctors').where('doctor name', isEqualTo: name).get();
    targetEmails.clear();
    for (var userSnapshot in userDoc.docs) {
      patients = userSnapshot.data()['Diet plan for patients'];
      // print(patients);
      for (var email in patients.keys) {
        targetEmails.add(email);
        // print(email);  // Do something with each email
      }
      // print(targetEmails);
    }
    setState(() {
      _buildPatientProfile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: DoctorDrawer(),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 9.h, top: 30.v, right: 18.h),
            decoration: BoxDecoration(
                color: appTheme.whiteA700,
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgHome2),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "Hello,",
                    style: CustomTextStyles.titleLargeBlack90003Regular,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    name,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: 30.v),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "Appointments",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 30.v),
                _buildPatientProfile(context),
                SizedBox(height: 30.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildLogOut(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: Builder(
        builder: (BuildContext builderContext) => AppbarLeadingImage(
          imagePath: ImageConstant.imgMegaphone,
          margin: EdgeInsets.only(left: 20.h, top: 20.v, right: 12.h, bottom: 20.v),
          onTap: () {
            Scaffold.of(builderContext).openDrawer();
          },
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 165.0),
          child: Text(
            "Meal Mate",
            style: theme.textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }

  Widget _buildPatientProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.v);
        },
        itemCount: targetEmails.length, // Use the length of the targetEmails list
        itemBuilder: (context, index) {
          return UserprofileItemWidget(
            onTapUserProfile: (selectedEmailName) {
              // print("Email $selectedEmailName tapped");
              selectedEmail = selectedEmailName!;
              Navigator.pushNamed(context, AppRoutes.patientDetailsScreen);
            },
            doctorName: targetEmails[index], // Pass the emails from the list
          );
        },
      ),
    );
  }

  Widget _buildLogOut(BuildContext context) {
    return CustomElevatedButton(
      height: 51.v,
      text: "Log Out",
      margin: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 32.v),
      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
      buttonTextStyle: CustomTextStyles.headlineSmallOnPrimaryContainer,
      onPressed: () {
        onTapLogOut(context);
      },
    );
  }

  onTapLogOut(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
