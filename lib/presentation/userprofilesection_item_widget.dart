import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserprofilesectionItemWidget extends StatefulWidget {
  final int index;
  final String name;
  final String description;
  final String link;

  const UserprofilesectionItemWidget({
    Key? key,
    required this.index,
    required this.name,
    required this.description,
    required this.link,
  }) : super(key: key);

  @override
  _UserprofilesectionItemWidgetState createState() =>
      _UserprofilesectionItemWidgetState();
}

class _UserprofilesectionItemWidgetState
    extends State<UserprofilesectionItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.v,
      width: 170.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 270.v,
              width: 170.h,
              decoration: BoxDecoration(
                color: appTheme.blueGray100,
                borderRadius: BorderRadius.circular(19.h),
                border: Border.all(
                  color: appTheme.gray400,
                  width: 1.h,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 25.h, top: 5.v, right: 20.h, bottom: 12.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomImageView(
                  //   imagePath: ImageConstant.imgImage1,
                  //   height: 123.adaptSize,
                  //   width: 123.adaptSize,
                  //   radius: BorderRadius.circular(20.h),
                  // ),
                  // SizedBox(height: 6.v),
                  Text(
                    widget.name, // Use the name from the widget
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    widget.description, // Use the description from the widget
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 12.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Container(
                    height: 31.v,
                    width: 117.h,
                    margin: EdgeInsets.only(left: 3.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 31.v,
                            width: 117.h,
                            decoration: BoxDecoration(
                              color: appTheme.green500,
                              borderRadius: BorderRadius.circular(15.h),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            print("Buy now tapped at index: ${widget.index}");
                            // Check if the link is not null or empty before launching
                            if (widget.link != null && widget.link.isNotEmpty) {
                              if (await canLaunchUrlString(widget.link)) {
                                await launchUrlString(widget.link);
                              } else {
                                print("Could not launch ${widget.link}");
                              }
                            }
                          },
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Buy now",
                              style: TextStyle(
                                color: appTheme.whiteA700,
                                fontSize: 20.fSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
