import 'dart:collection';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/ThemeStyle.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPVerifyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OTPVerifyScreenState();
  }
}

class OTPVerifyScreenState extends State<OTPVerifyScreen>{
  TextEditingController tfPhoneController = new TextEditingController();
  bool otpInvalid = false; //This controls the visibility of invalid otp error
  bool showOTPResent = false; // toggle this to show otp resent info and untoggle after desired time to hide it back
  bool otpVerified = false;

  void otpEntered(otp){
    //TODO:: Verify OTP here

    setState(() {
      otpVerified = true;
    });
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context, "dashboard", ModalRoute.withName('/'));
    });
  }

  void skipPressed(){
    //TODO:: Skip now pressed for login
  }

  @override
  Widget build(BuildContext context) {
    if(otpVerified) return successScreen();
    else return SafeArea(
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
                    height: 0.03.sh,
                    right: 0,
                    top: 0.005.sh,
                    child: InkWell(
                      child: Text("Skip for now", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ThemeStyle.primaryColor),),
                      onTap: () => skipPressed(),
                    ),
                  ),
                  Positioned(
                    height: 0.03.sh,
                    left: 0,
                    child: InkWell(
                      child: Image(
                        fit: BoxFit.cover,
                        width: 0.05.sh,
                        height: 0.05.sh,
                        image: AssetImage("assets/back.png"),
                      ),
                      onTap: () => {
                        Navigator.of(context).pop()
                      },
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter the 4-digit\ncode sent to you at", style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold), textAlign: TextAlign.start, softWrap: true,),
                          Text("9999999999", style: TextStyle(fontSize: 30, color: ThemeStyle.primaryColor, fontWeight: FontWeight.bold), textAlign: TextAlign.start, softWrap: true,)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  OTPTextField(
                    length: 4,
                    width: 0.8.sw,
                    fieldWidth: 0.15.sw,
                    style: TextStyle(
                        fontSize: 16,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) => otpEntered(pin),
                  ),
                  otpInvalid ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("The code you entered does not match. Try again.", style: TextStyle(fontSize: 14, color: Colors.red), textAlign: TextAlign.start,),
                    ],
                  ) : SizedBox(),
                  SizedBox(height: 0.4.sh,),
                  showOTPResent ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(160, 235, 164, 29),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text("Text message resent.", style: TextStyle(fontSize: 14, color: Colors.black), textAlign: TextAlign.start,),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ) : SizedBox(),
                  InkWell(
                    child: Text("I haven\'t received a code", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ThemeStyle.primaryColor),),
                    onTap: (){},
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget successScreen(){
    return Container(
      color: ThemeStyle.primaryColor,
      alignment: Alignment.center,
      child: Image(
        fit: BoxFit.contain,
        width: 100,
        height: 100,
        image: AssetImage("assets/tick.png"),
      ),
    );
  }
}