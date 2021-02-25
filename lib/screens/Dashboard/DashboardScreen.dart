import 'package:flutter/cupertino.dart';
import 'package:water_delivery/ThemeStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen>{

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.05.sh),
      color: ThemeStyle.primaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Material(
        child: InkWell(
          child: Text('DASHBOARD', style: TextStyle(fontSize: 46, color: Colors.white),),
          onTap: (){Navigator.of(context).pushNamed("location");},
        ),
      ),
    );
  }
}