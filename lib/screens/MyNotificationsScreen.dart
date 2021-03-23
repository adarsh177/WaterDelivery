import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:water_delivery/ThemeStyle.dart';

class MyNotificationsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyNotificationsScreenState();
  }
}

class MyNotificationsScreenState extends State<MyNotificationsScreen>{

  void closePressed(){
    Navigator.of(context).pop();
  }

  void clearNotifications(){
    // TODO :: CLEAR NOTIFICATIONS
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 0.04.sh),
            color: Color.fromARGB(255, 255, 255, 255),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 0.03.sh,),
                    Positioned(
                      right: 0.04.sh,
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
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sh),
                  child: Text("My notifications", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 30), textAlign: TextAlign.start),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => NotificationEntry("Order #234", "Order Placed at 12 53 and will be delivered in few days from now", "12:53", index == 0),
                    itemCount: 10,
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () => clearNotifications(),
                  child: Text("Clear all", style: TextStyle(color: ThemeStyle.primaryColor, fontSize: 16), textAlign: TextAlign.center),
                ),
              ],
            )
        ),
      ),
    );
  }

  // isActive basically highlights the notification
  Widget NotificationEntry(String title, String body, String formattedTime, bool isActive){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sh, vertical: 0.025.sh),
      color: isActive ? ThemeStyle.primaryColor.withAlpha(30) : Colors.white,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black), textAlign: TextAlign.start,),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(formattedTime, style: TextStyle(fontSize: 14, color: Colors.black54), textAlign: TextAlign.end,),
              ),
            ],
          ),
          SizedBox(height: 0.025.sh,),
          Text(body, style: TextStyle(fontSize: 14, color: Colors.black87), textAlign: TextAlign.start,)
        ],
      ),
    );
  }

}