import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/ThemeStyle.dart';

class LoginScreenP2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenP2State();
  }
}

class LoginScreenP2State extends State<LoginScreenP2>{
  TextEditingController tfPhoneController = new TextEditingController();

  void skippedPressed(){
    //TODO ::  SKIP PRESSED IN LOGIN SCREEN2
  }

  void nextButtonPressed(){
    // TODO:: SEND OTP TO THE NUMBER AND ALSO PASS THE NUMBER TO otpverify as prop
    Navigator.of(context).pushNamed("otpverify", arguments: {
      "number": tfPhoneController.text,
    });
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
                    width: 0,
                    height: 0.03.sh,
                    image: AssetImage("assets/logo_colored.png"),
                  ),
                  Positioned(
                    height: 0.03.sh,
                    right: 0,
                    top: 0.005.sh,
                    child: InkWell(
                      child: Text("Skip for now", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ThemeStyle.primaryColor),),
                      onTap: (){},
                    ),
                  )
                ],
              )
              ,
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 20,),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Enter your phone \nnumber", style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold), textAlign: TextAlign.start,)
                        ],
                      ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        fit: BoxFit.contain,
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/india_flag.png"),
                      ),
                      SizedBox(width: 15,),
                      Text("+91", style: TextStyle(fontSize: 16, color: Colors.black54),),
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                          keyboardType: TextInputType.phone,
                          controller: tfPhoneController,
                          buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                          maxLength: 10,
                          autofocus: true,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.15.sh,),
                  ButtonTheme(
                      minWidth: double.infinity,
                      child: RaisedButton(
                        color: ThemeStyle.primaryColor,
                        onPressed: () => nextButtonPressed(),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        textColor: ThemeStyle.secondaryColor,
                        child: Text('Next', style: TextStyle(fontSize: 16),),
                      )
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}