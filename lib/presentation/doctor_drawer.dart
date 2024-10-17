import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:mealmate/main.dart';
import '../core/utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class DoctorDrawer extends StatefulWidget {
  @override
  _DoctorDrawerState createState() => _DoctorDrawerState();
}

class _DoctorDrawerState extends State<DoctorDrawer> {

  String regno = '', experience = '', qualifications = '';

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    final userDoc = await _firestore.collection('doctors').where('email', isEqualTo: email).get();
    for(var username in userDoc.docs){
      regno = username.data()['regno'];
      experience = username.data()['experience'];
    }
    setState(() {
      _buildListTile('Registration Number',regno);
      _buildListTile('Experience',experience);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF41AC60),
            ),
            child: Row(
              children: [
                SizedBox(width: 10.v),
                CustomImageView(
                  imagePath: ImageConstant.userimg,
                  height: 100.v,
                  radius: BorderRadius.circular(
                    100.h,
                  ),
                  margin: EdgeInsets.only(top: 6.v),
                ),
                SizedBox(width: 30.v),
                Padding(
                  padding: EdgeInsets.only(
                    top: 24.v,
                    bottom: 18.v,
                  ),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,  // Set the maximum number of lines you want to display
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          _buildListTile('Registration Number',regno),
          _buildListTile('Experience',experience),
          SizedBox(height: 340.h),
          _buildLogOut(context),
        ],
      ),
    );
  }

  Widget _buildListTile(String text, String value) {
    return ListTile(
      title: Row(
        children: [
          SizedBox(width: 10.v),
          Text(text, style: Theme.of(context).textTheme.bodyMedium,),
          Spacer(flex: 2),
          Text(value),
          SizedBox(width: 10.v),
        ],
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
