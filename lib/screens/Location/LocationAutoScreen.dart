
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ThemeStyle.dart';

class LocationAutoScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LocationAutoScreenState();
  }

}

class LocationAutoScreenState extends State<LocationAutoScreen>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
            alignment: Alignment.center,
            color: Colors.grey[350].withAlpha(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  height: 1.sh,
                  width: 1.sw,
                  child: Image(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    image: AssetImage("assets/map_dummy.png"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    ),
                    height: 0.5.sh,
                    width: 1.sw,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Select your location\nfrom the map", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 30), textAlign: TextAlign.start),
                        Text("Move the map pin to find your location and\nselect the delivery address.", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16), textAlign: TextAlign.start,),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20,),
                                  Image(
                                    fit: BoxFit.contain,
                                    width: 20,
                                    height: 20,
                                    image: AssetImage("assets/location_cursor.png"),
                                  ),
                                  SizedBox(width: 20,),
                                  Text("Piata Unirii 2", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16), textAlign: TextAlign.start,),
                                  SizedBox(width: 20,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                height: 2,
                                width: 0.85.sw,
                                child: Container(color: Colors.grey[350],),
                              )
                            ],
                          ),
                        ),
                        ButtonTheme(
                          minWidth: double.infinity,
                          child: RaisedButton(
                            color: ThemeStyle.primaryColor,
                            onPressed: () => {},
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            textColor: ThemeStyle.secondaryColor,
                            child: Text('Next', style: TextStyle(fontSize: 18),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
