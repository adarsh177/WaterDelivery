import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:water_delivery/ThemeStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_delivery/screens/AllowNotificationScreen.dart';
import 'package:water_delivery/screens/Dashboard/DashboardCards.dart';
import 'package:water_delivery/screens/Dashboard/DashboardMenu.dart';
import 'package:water_delivery/screens/Location/LocationMainScreen.dart';
import 'package:water_delivery/screens/Location/LocationManualScreen.dart';

class DashboardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen>{
  TextEditingController tfSearchController = new TextEditingController();
  String selectedCategory = "product"; // product, service

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(0.01.sh),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     ActionBar(),
          //     SubText(),
          //     SizedBox(height: 10,),
          //     SearchBar(),
          //     SizedBox(height: 10,),
          //     Carousel(),
          //     SizedBox(height: 10,),
          //     BrandsSection(),
          //     CategoriesSection(),
          //   ],
          // ),
          child: ListView(
            children: [
              ActionBar(),
              SubText(),
              SizedBox(height: 10,),
              SearchBar(),
              SizedBox(height: 10,),
              Carousel(),
              SizedBox(height: 10,),
              BrandsSection(),
              CategoriesSection(),
            ]
          ),
        ),
      ),
    );
  }

  void MenuIconPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return DashboardMenu();}));
  }

  void BellIconPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return AllowNotificationsScreen();}));
  }

  void BagIconPressed(){

  }

  void ChangeLocationPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return LocationMainScreen();}));
  }

  Widget BrandsSection(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Brands", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black54),),
          SizedBox(height: 10,),
          SizedBox(
            width: 1.sw,
            height: 120,
            child: ListView.builder(itemBuilder: (_, index){
              return DashboardCards.BrandsCard(AssetImage("assets/brand_bisleri.png"), "Bisleri", (){});
            }, itemCount: 10, scrollDirection: Axis.horizontal, shrinkWrap: true,),
          ),
        ],
      ),
    );
  }

  Widget CategoriesSection(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black54),),
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => OnCatogryTabPressed("product"),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: selectedCategory == "product" ? ThemeStyle.primaryColor : Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: Text("Product", style: TextStyle(fontSize: 14, color: selectedCategory == "product" ? Colors.white : Colors.black87),),
                ),
              ),
              SizedBox(width: 10,),
              InkWell(
                onTap: () => OnCatogryTabPressed("service"),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: selectedCategory == "service" ? ThemeStyle.primaryColor : Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: Text("Services", style: TextStyle(fontSize: 14, color: selectedCategory == "service" ? Colors.white : Colors.black87),),
                ),
              )
            ],
          ),
          SizedBox(height: 40,),
          selectedCategory == "service" ? CategoryTab_Service() : CategoryTab_Product(),
        ],
      ),
    );
  }

  Widget CategoryTab_Product(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Normal Water", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
        SizedBox(height: 20),
        SizedBox(
          width: 1.sw,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            children: [
              DashboardCards.ProductCard("RO Water", "Qty 20L", "Rs25", (){}),
              DashboardCards.ProductCard("Bisleri", "Qty 20L", "Rs95", (){}),
              DashboardCards.ProductCard("Kinly", "Qty 20L", "Rs95", (){}),
              DashboardCards.ProductCard("Aquafina", "Qty 20L", "Rs85", (){}),
            ],
          ),
        ),

        SizedBox(height: 20,),
        Text("Alkalie Products", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
        SizedBox(height: 20),
        SizedBox(
          width: 1.sw,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            children: [
              DashboardCards.ProductCard("10L Alkaline Water", "Qty 10L", "Rs95", (){}),
              DashboardCards.ProductCard("5L Alkaline Water", "Qty 5L", "Rs95", (){}),
              DashboardCards.ProductCard("Alkaline Stone pouch", "Qty: 1", "Rs95", (){}),
            ],
          ),
        )
      ],
    );
  }

  Widget CategoryTab_Service(){
    return SizedBox(
      width: 1.sw,
      child: ListView(
        shrinkWrap: true,
        children: [
          DashboardCards.ServiceCard("Water Tank Cleaning", "4.8 (120+)", "60 Min", "Rs200", (){}),
          DashboardCards.ServiceCard("Water Tank Cleaning", "4.8 (120+)", "60 Min", "Rs200", (){}),
          DashboardCards.ServiceCard("Water Tank Cleaning", "4.8 (120+)", "60 Min", "Rs200", (){}),
          DashboardCards.ServiceCard("Water Tank Cleaning", "4.8 (120+)", "60 Min", "Rs200", (){}),
        ],
      ),
    );
  }

  void OnCatogryTabPressed(str){
    setState(() {
      selectedCategory = str;
    });
  }

  Widget Carousel(){
    return Container(
      width: double.infinity,
      height: 0.2.sh,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black26,
    );
  }

  Widget SearchBar(){
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black26, width: 1))
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image(
                fit: BoxFit.contain,
                width: 15,
                height: 15,
                image: AssetImage("assets/ic_search.png"),
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search food you like",
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 16, color: Colors.black87),
              keyboardType: TextInputType.phone,
              controller: tfSearchController,
            ),
            flex: 1,
          ),
          SizedBox(width: 20,),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image(
                fit: BoxFit.contain,
                width: 15,
                height: 15,
                image: AssetImage("assets/ic_settings.png"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget SubText(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Discover new", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          RichText(text: TextSpan(children: [
            TextSpan(text: "healthy ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ThemeStyle.primaryColor)),
            TextSpan(text: "experiences", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ThemeStyle.black)),
          ]),),
        ],
      ),
    );
  }

  Widget ActionBar(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => MenuIconPressed(),
            child: Image(
              fit: BoxFit.contain,
              width: 25,
              height: 25,
              image: AssetImage("assets/ic_menu.png"),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Zakir Nagar West", style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                InkWell(
                  onTap: () => ChangeLocationPressed(),
                  child: Text("Change", style: TextStyle(color: ThemeStyle.primaryColor, fontSize: 14, fontWeight: FontWeight.normal)),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => BellIconPressed(),
            child: Image(
              fit: BoxFit.contain,
              width: 30,
              height: 30,
              image: AssetImage("assets/ic_bell.png"),
            ),
          ),
          SizedBox(width: 20,),
          InkWell(
            onTap: () => BagIconPressed(),
            child: Image(
              fit: BoxFit.contain,
              width: 30,
              height: 30,
              image: AssetImage("assets/ic_lock.png"),
            ),
          ),
        ],
      ),
    );
  }
}