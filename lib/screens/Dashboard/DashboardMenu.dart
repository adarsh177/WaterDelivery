import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/ThemeStyle.dart';


// 3 parts - conditional menu, general menu, logout
class DashboardMenu extends StatelessWidget{
  bool isLoggedIn = true; //TODO:: This var decides which menu to show
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          width: 1.sw,
          height: 1.sh,
          color: ThemeStyle.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConditionalMenu(),
              GeneralMenu(),
              MenuItem("Logout", AssetImage("assets/ic_logout.png"), (){}),
            ],
          ),
        ),
      ),
    );
  }

  Widget ConditionalMenu(){
    if(isLoggedIn){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuItem("Home", AssetImage("assets/ic_home.png"), (){}),
          SizedBox(height: 25,),
          MenuItem("My profile", AssetImage("assets/ic_profile.png"), (){}),
          SizedBox(height: 25,),
          MenuItem("My orders", AssetImage("assets/ic_order.png"), (){}),
          SizedBox(height: 25,),
          MenuItem("My Subscriptions", AssetImage("assets/ic_repeat.png"), (){}),
          SizedBox(height: 25,),
          MenuItem("Event Request", AssetImage("assets/ic_calendar.png"), (){}),
          SizedBox(height: 25,),
          MenuItem("My addresses", AssetImage("assets/ic_locationpin.png"), (){}),
          SizedBox(height: 25,),
          MenuItem("Contact", AssetImage("assets/ic_contact.png"), (){}),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MenuItem("Signin or Signup", AssetImage("assets/ic_signin.png"), (){}),
        SizedBox(height: 25,),
        MenuItem("My orders", AssetImage("assets/ic_order.png"), (){}),
        SizedBox(height: 25,),
        MenuItem("Settings", AssetImage("assets/ic_setting.png"), (){}),
        SizedBox(height: 25,),
        MenuItem("Contact", AssetImage("assets/ic_contact.png"), (){}),
      ],
    );
  }

  Widget GeneralMenu(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => {},
          child: Text("Terms & Conditions", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300))
        ),
        SizedBox(height: 20,),
        InkWell(
            onTap: () => {},
            child: Text("Privacy Policy", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300))
        ),
        SizedBox(height: 20,),
        InkWell(
            onTap: () => {},
            child: Text("Faq & Support", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300))
        )
      ]
    );
  }

  Widget MenuItem(String lable, AssetImage icon, var callback){
    return InkWell(
      onTap: () => callback(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            fit: BoxFit.contain,
            width: 20,
            height: 20,
            image: icon,
          ),
          SizedBox(width: 20,),
          Text(lable, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}