import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/ThemeStyle.dart';

class LoginScreenP1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenP1State();
  }
}

class LoginScreenP1State extends State<LoginScreenP1>{
  TextEditingController tfPhoneController = new TextEditingController();

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
              Image(
                fit: BoxFit.contain,
                width: double.infinity,
                height: 0.03.sh,
                image: AssetImage("assets/logo_colored.png"),
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    fit: BoxFit.contain,
                    width: 0.45.sh,
                    height: 0.45.sh,
                    image: AssetImage("assets/onboarding_final.png"),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Welcome to ", style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold),),
                      Text("Karry", style: TextStyle(fontSize: 30, color: ThemeStyle.primaryColor, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 40,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("loginp2");
                    },
                    child: Row(
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
                              decoration: InputDecoration(
                                hintText: "Enter your mobile number",
                              ),
                              buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                              maxLength: 10,
                              readOnly: true,
                              enabled: false,
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                              keyboardType: TextInputType.phone,
                              controller: tfPhoneController,
                            )
                        )
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

}