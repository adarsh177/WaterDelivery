
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ThemeStyle.dart';

class LocationManualScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LocationManualScreenState();
  }

}

class LocationManualScreenState extends State<LocationManualScreen>{
  TextEditingController tfPlaceController = new TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 0.03.sh,),
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
                SizedBox(height: 40,),
                Text("Where do you want\nus to deliver?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 30), textAlign: TextAlign.start),
                SizedBox(height: 40,),
                Text("Enter a new address", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45, fontSize: 14), textAlign: TextAlign.start),
                SizedBox(height: 20,),
                Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            fit: BoxFit.contain,
                            width: 20,
                            height: 20,
                            image: AssetImage("assets/location_cursor.png"),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                              controller: tfPlaceController,
                              decoration: InputDecoration(
                                hintText: "Enter a new address",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                        ],
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 2,
                        width: 0.85.sw,
                        child: Container(color: Colors.black54,),
                      )
                    ],
                  ),
                ),
                suggestionList(),
              ],
            )
        ),
      ),
    );
  }

  Widget suggestionList(){
    // TODO add suggestion list builder according to whatever the logic is
    return Container();
  }
}