import 'package:flutter/material.dart';
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
      },
      initialRoute: "/",
    );
  }
}
