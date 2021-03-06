
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/screens/Location/LocationAutoScreen.dart';
import 'package:water_delivery/screens/Location/LocationManualScreen.dart';

import '../../ThemeStyle.dart';

class LocationMainScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LocationMainScreenState();
  }

}

class LocationMainScreenState extends State<LocationMainScreen>{

  void closePressed(){
    //TODO:: CLOSE PRESSED
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(0.04.sh),
          color: Color.fromARGB(255, 255, 255, 255),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 0.03.sh,
                    image: AssetImage("assets/logo_colored.png"),
                  ),
                  Positioned(
                    right: 0,
                    child: InkWell(
                      child: Image(
                        fit: BoxFit.contain,
                        width: 0.025.sh,
                        height: 0.025.sh,
                        image: AssetImage("assets/ic_cross.png"),
                      ),
                      onTap: () => closePressed(),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        fit: BoxFit.contain,
                        width: 0.45.sw,
                        image: AssetImage("assets/location_image.png"),
                      ),
                      SizedBox(height: 40,),
                      Text("Where do you want\nus to deliver?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 30), textAlign: TextAlign.center),
                      SizedBox(height: 10,),
                      Container(
                        width: 0.8.sw,
                        child: Text("Please allow app access to your location to\nfetch your delivery address", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16), textAlign: TextAlign.center,),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: ThemeStyle.primaryColor,
                  onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationAutoScreen()));},
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  textColor: ThemeStyle.secondaryColor,
                  child: Text('Use current location', style: TextStyle(fontSize: 18),),
                ),
              ),
              SizedBox(height: 10,),
              ButtonTheme(
                minWidth: double.infinity,
                child: MaterialButton(
                  color: ThemeStyle.secondaryColor,
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationManualScreen()));},
                  elevation: 0,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  textColor: Colors.black54,
                  child: Text('Select location manually', style: TextStyle(fontSize: 18),),
                ),
              ),
              SizedBox(height: 20,),
            ],
          )
        ),
      ),
    );
  }
}