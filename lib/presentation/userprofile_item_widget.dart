import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';

class UserprofileItemWidget extends StatefulWidget {
  final String doctorName;
  final void Function(String?)? onTapUserProfile;

  UserprofileItemWidget({
    Key? key,
    required this.doctorName,
    this.onTapUserProfile,
  }) : super(key: key);

  @override
  _UserprofileItemWidgetState createState() => _UserprofileItemWidgetState();
}

class _UserprofileItemWidgetState extends State<UserprofileItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTapUserProfile?.call(widget.doctorName);
      },
      child: Container(
        padding: EdgeInsets.all(7.h),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgD11,
              height: 65.v,
              width: 68.h,
              radius: BorderRadius.circular(
                32.h,
              ),
              margin: EdgeInsets.only(top: 6.v),
            ),
            Spacer(
              flex: 27,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 24.v,
                bottom: 18.v,
              ),
              child: Text(
                widget.doctorName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Spacer(
              flex: 72,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 25.v,
              width: 13.h,
              margin: EdgeInsets.only(
                top: 23.v,
                right: 20.h,
                bottom: 22.v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
