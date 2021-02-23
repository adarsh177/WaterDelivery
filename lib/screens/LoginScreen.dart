import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          child: Container(
            color: Colors.white,
          ),
        )
    );
  }

}