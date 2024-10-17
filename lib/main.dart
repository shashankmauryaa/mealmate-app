import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealmate/presentation/home_screen.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

String email = '', name = '', selectedGoal ='', selectedGender ='';
String selectedDay = '0', selectedMonth = '0', selectedYear = '0';
String selectedFeet = '4', selectedInch = '0', selectedWeight = '0';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'mealmate',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeScreen,
          routes: AppRoutes.routes,
          home: BackgroundImageWidget(
            imagePath: ImageConstant.imgHome,
            child: HomeScreen(),
          ),
        );
      },
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const BackgroundImageWidget({
    Key? key,
    required this.child,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
