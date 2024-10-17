import 'package:flutter/material.dart';
import 'package:mealmate/presentation/home_screen.dart';
import 'package:mealmate/presentation/patient_details_screen.dart';
import 'package:mealmate/presentation/user_signin_screen.dart';
import 'package:mealmate/presentation/onbordingone_screen.dart';
import 'package:mealmate/presentation/doctor_details_screen.dart';
import 'package:mealmate/presentation/successfully_booked_screen.dart';
import 'package:mealmate/presentation/onbordingthree_screen.dart';
import 'package:mealmate/presentation/signup_screen.dart';
import 'package:mealmate/presentation/onbordingtwo_screen.dart';
import 'package:mealmate/presentation/user_dashboard_screen.dart';
import 'package:mealmate/presentation/user_diet_details_screen.dart';
import 'package:mealmate/presentation/onbordingfour_screen.dart';
import 'package:mealmate/presentation/doctor_signin_screen.dart';
import 'package:mealmate/presentation/doctor_dashboard_screen.dart';
import 'package:mealmate/presentation/app_navigation_screen.dart';
import 'package:mealmate/presentation/doctor_signup_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String userSigninScreen = '/user_signin_screen';

  static const String doctorSignupScreen = '/doctor_signup_screen';

  static const String onbordingoneScreen = '/onbordingone_screen';

  static const String doctorDetailsScreen = '/doctor_details_screen';

  static const String successfullyBookedScreen = '/successfully_booked_screen';

  static const String onbordingthreeScreen = '/onbordingthree_screen';

  static const String patientDetailsScreen = '/patient_details_screen';

  static const String signupScreen = '/signup_screen';

  static const String onbordingtwoScreen = '/onbordingtwo_screen';

  static const String userDashboardScreen = '/user_dashboard_screen';

  static const String userDietDetailsScreen = '/user_diet_details_screen';

  static const String onbordingfourScreen = '/onbordingfour_screen';

  static const String doctorSigninScreen = '/doctor_signin_screen';

  static const String doctorDashboardScreen = '/doctor_dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(),
    userSigninScreen: (context) => UserSigninScreen(),
    onbordingoneScreen: (context) => OnbordingoneScreen(),
    doctorDetailsScreen: (context) => DoctorDetailsScreen(),
    doctorSignupScreen: (context) => DocSignupScreen(),
    successfullyBookedScreen: (context) => SuccessfullyBookedScreen(),
    onbordingthreeScreen: (context) => OnbordingthreeScreen(),
    patientDetailsScreen: (context) => PatientDetailsScreen(),
    signupScreen: (context) => SignupScreen(),
    onbordingtwoScreen: (context) => OnbordingtwoScreen(),
    userDashboardScreen: (context) => UserDashboardScreen(),
    userDietDetailsScreen: (context) => UserDietDetailsScreen(),
    onbordingfourScreen: (context) => OnbordingfourScreen(),
    doctorSigninScreen: (context) => DoctorSigninScreen(),
    doctorDashboardScreen: (context) => DoctorDashboardScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
