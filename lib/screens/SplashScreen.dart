import 'package:flutter/cupertino.dart';
import 'package:water_delivery/ThemeStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    moveForward();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.05.sh),
      color: ThemeStyle.primaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image(
        fit: BoxFit.contain,
        width: 0.3.sw,
        height: 0.3.sw,
        image: AssetImage("assets/logo.png"),
      ),
    );
  }

  void moveForward(){
    //TODO:: CHECK LOGIN STATUS AND DECIDE NEXT SCREEN
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).popAndPushNamed("onboarding");
    });
  }
}