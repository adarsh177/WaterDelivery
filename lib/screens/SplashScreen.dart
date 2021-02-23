import 'package:flutter/cupertino.dart';
import 'package:water_delivery/ThemeStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: true);
    moveForward(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.05.sh),
      color: ThemeStyle.primaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image(
        fit: BoxFit.contain,
        width: 0.3.sw,
        height: 0.3.sw,
        image: AssetImage("assets/logo.png"),
      ),
    );
  }

  void moveForward(BuildContext context){
    Future.delayed(Duration(seconds: 5), (){
      Navigator.of(context).pushNamed("onboarding");
    });
  }

}