import 'package:flutter/cupertino.dart';
import 'package:water_delivery/ThemeStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_delivery/screens/AllowNotificationScreen.dart';
import 'package:water_delivery/screens/Dashboard/DashboardMenu.dart';
import 'package:water_delivery/screens/Location/LocationMainScreen.dart';
import 'package:water_delivery/screens/Location/LocationManualScreen.dart';

class DashboardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(0.01.sh),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActionBar(),
            ],
          ),
        ),
      ),
    );
  }

  void MenuIconPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return DashboardMenu();}));
  }

  void BellIconPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return AllowNotificationsScreen();}));
  }

  void BagIconPressed(){

  }

  void ChangeLocationPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return LocationMainScreen();}));
  }

  Widget ActionBar(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => MenuIconPressed(),
            child: Image(
              fit: BoxFit.contain,
              width: 25,
              height: 25,
              image: AssetImage("assets/ic_menu.png"),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Zakir Nagar West", style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                InkWell(
                  onTap: () => ChangeLocationPressed(),
                  child: Text("Change", style: TextStyle(color: ThemeStyle.primaryColor, fontSize: 14, fontWeight: FontWeight.normal)),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => BellIconPressed(),
            child: Image(
              fit: BoxFit.contain,
              width: 30,
              height: 30,
              image: AssetImage("assets/ic_bell.png"),
            ),
          ),
          SizedBox(width: 20,),
          InkWell(
            onTap: () => BagIconPressed(),
            child: Image(
              fit: BoxFit.contain,
              width: 30,
              height: 30,
              image: AssetImage("assets/ic_lock.png"),
            ),
          ),
        ],
      ),
    );
  }
}