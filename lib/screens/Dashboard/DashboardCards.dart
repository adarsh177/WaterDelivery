import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/ThemeStyle.dart';

class DashboardCards{

  static Widget BrandsCard(imageProvider, text, onTap){
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.only(top: 5, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              fit: BoxFit.contain,
              width: 80,
              height: 80,
              image: imageProvider,
            ),
            SizedBox(height: 5,),
            Text(text, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),)
          ],
        ),
      ),
    );
  }

  static Widget ProductCard(title, qty, rate, onTap){
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              width: double.infinity,
              height: 0.4.sw,
            ),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),),
            SizedBox(height: 5,),
            Text(qty, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black38, fontSize: 14),),
            SizedBox(height: 15,),
            Text(rate, style: TextStyle(fontWeight: FontWeight.bold, color: ThemeStyle.primaryColor, fontSize: 18),),
          ],
        ),
      ),
    );
  }

  static Widget ServiceCard(title, star, time, rate, onTap){
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              width: double.infinity,
              height: 0.4.sw,
            ),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),),
            SizedBox(height: 10,),
            Row(
              children: [
                Image(
                  fit: BoxFit.contain,
                  width: 15,
                  height: 15,
                  image: AssetImage("assets/ic_star.png"),
                ),
                SizedBox(width: 5,),
                Text(star, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black38, fontSize: 14),),
                SizedBox(width: 20,),
                Image(
                  fit: BoxFit.contain,
                  width: 15,
                  height: 15,
                  image: AssetImage("assets/ic_watch.png"),
                ),
                SizedBox(width: 5,),
                Text(time, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black38, fontSize: 14),),
              ],
            ),
            SizedBox(height: 15,),
            Text(rate, style: TextStyle(fontWeight: FontWeight.bold, color: ThemeStyle.primaryColor, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}