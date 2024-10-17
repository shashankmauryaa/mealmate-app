import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/main.dart';
import 'package:mealmate/widgets/custom_elevated_button.dart';
import 'package:mealmate/widgets/custom_text_form_field.dart';

import 'doctor_dashboard_screen.dart';
import 'successfully_prescribed_screen.dart';

class DoctorPrescriptionScreen extends StatefulWidget {
  const DoctorPrescriptionScreen({Key? key}) : super(key: key);

  @override
  _DoctorPrescriptionScreenState createState() => _DoctorPrescriptionScreenState();
}

class _DoctorPrescriptionScreenState extends State<DoctorPrescriptionScreen> {
  TextEditingController _mondayController = TextEditingController();
  TextEditingController _tuesdayController = TextEditingController();
  TextEditingController _wednesdayController = TextEditingController();
  TextEditingController _thursdayController = TextEditingController();
  TextEditingController _fridayController = TextEditingController();
  TextEditingController _saturdayController = TextEditingController();
  TextEditingController _sundayController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;
  String monday = '', tuesday = '', wednesday = '', thursday = '', friday = '', saturday = '', sunday = '';

  void updatePatientDetails() async {
    final userDoc = await _firestore.collection('doctors').where('doctor name', isEqualTo: name).get();

    for (var userSnapshot in userDoc.docs) {
      final userId = userSnapshot.id;

      // Fetch the current data
      final currentData = userSnapshot.data() as Map<String, dynamic>;

      // Extract the existing 'Diet plan for patients' data
      final existingDietPlan = currentData['Diet plan for patients'] as Map<String, dynamic>;

      // Remove the original entry for selectedEmail
      existingDietPlan.remove(selectedEmail);

      // Define the new data to be added
      final newData = {
        selectedEmail: {
          'monday': monday,
          'tuesday': tuesday,
          'wednesday': wednesday,
          'thursday': thursday,
          'friday': friday,
          'saturday': saturday,
          'sunday': sunday,
        },
      };

      // Merge the existing and new data
      final updatedData = {
        'Diet plan for patients': {
          ...existingDietPlan,
          ...newData,
        },
      };

      await _firestore.collection('doctors').doc(userId).update(updatedData);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 15.h, top: 50.v, right: 15.h),
            child: Column(
              children: [
                Text("Enter Details", style: theme.textTheme.displaySmall),
                SizedBox(height: 40.v),
                CustomTextFormField(
                  onChanged: (value) {
                    monday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _mondayController,
                  hintText: "Monday",
                  maxLines: 7,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.v),
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 30.v),
                CustomTextFormField(
                  onChanged: (value) {
                    tuesday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _tuesdayController,
                  hintText: "Tuesday",
                  textInputAction: TextInputAction.done,
                  maxLines: 8,
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 30.v),
                CustomTextFormField(
                  onChanged: (value) {
                    wednesday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _wednesdayController,
                  hintText: "Wednesday",
                  maxLines: 7,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.v),
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 30.v),
                CustomTextFormField(
                  onChanged: (value) {
                    thursday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _thursdayController,
                  hintText: "Thursday",
                  maxLines: 7,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.v),
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 30.v),
                CustomTextFormField(
                  onChanged: (value) {
                    friday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _fridayController,
                  hintText: "Friday",
                  maxLines: 7,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.v),
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 30.v),
                CustomTextFormField(
                  onChanged: (value) {
                    saturday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _saturdayController,
                  hintText: "Saturday",
                  maxLines: 7,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.v),
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 30.v),
                CustomTextFormField(
                  onChanged: (value) {
                    sunday = value;
                    // print("Text field content changed: $value");
                  },
                  controller: _sundayController,
                  hintText: "Sunday",
                  maxLines: 7,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.v),
                  borderDecoration:
                  TextFormFieldStyleHelper.fillSecondaryContainer,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
                SizedBox(height: 40.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildPrescribe(context),
      ),
    );
  }

  Widget _buildPrescribe(BuildContext context) {
    return CustomElevatedButton(
      height: 51.v,
      text: "Prescribe",
      margin: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 32.v),
      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
      buttonTextStyle: CustomTextStyles.headlineSmallOnPrimaryContainer,
      onPressed: () {
        updatePatientDetails();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyPrescribedScreen()));
      },
    );
  }
}
