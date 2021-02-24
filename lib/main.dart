import 'package:flutter/material.dart';
import 'package:water_delivery/screens/Dashboard/DashboardScreen.dart';
import 'file:///D:/Project/WaterDelivery/water_delivery/lib/screens/LoginScreen/LoginScreen_P1.dart';
import 'file:///D:/Project/WaterDelivery/water_delivery/lib/screens/LoginScreen/LoginScreen_P2.dart';
import 'package:water_delivery/screens/OTPVerifyScreen.dart';
import 'package:water_delivery/screens/OnBoardingScreen.dart';
import 'package:water_delivery/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Delivery',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "onboarding": (context) => OnBoardingScreen(),
        "loginp1": (context) => LoginScreenP1(),
        "loginp2": (context) => LoginScreenP2(),
        "otpverify": (context) => OTPVerifyScreen(),
        "dashboard": (context) => DashboardScreen(),
      },
      initialRoute: "/",
    );
  }
}
