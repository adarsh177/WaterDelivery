import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_delivery/ThemeStyle.dart';

class OnBoardingScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return OnBoardingScreenState();
  }
}

class OnBoardingScreenState extends State<OnBoardingScreen>{
  int currentCarouselIndex = 0;
  int totalCarouselLength = 3;
  PageController carouselController = PageController(initialPage: 0);

  void nextButtonPressed(){
    if(currentCarouselIndex == totalCarouselLength-1){
      skipPressed();
    }else{
      setState(() {
        carouselController.jumpToPage(++currentCarouselIndex);
      });
    }
  }

  void skipPressed(){
    Navigator.of(context).popAndPushNamed("loginp1");
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
              Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        slideCarousel(),
                        SizedBox(height: 10,),
                        horizontalIndicators(totalCarouselLength, currentCarouselIndex),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 20,),
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
                  child: Text('Next', style: TextStyle(fontSize: 18),),
                ),
              ),
              SizedBox(height: 10,),
              ButtonTheme(
                minWidth: double.infinity,
                child: MaterialButton(
                  color: ThemeStyle.secondaryColor,
                  onPressed: () => skipPressed(),
                  elevation: 0,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  textColor: Colors.black54,
                  child: Text('Skip', style: TextStyle(fontSize: 18),),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Widget slideCarousel(){
    var slideTitles = [
      "Subscribe\nOnce",
      "Stay\nHydrated",
      "Hygenic\nDelivery",
    ];
    var slideTexts = [
      "Subscribe once and we will get it delivered on time without any hassle.",
      "Now you don’t have to worry about running out of water. We will cover you.",
      "We know the value of hygiene at any stage",
    ];
    var slideImages = [
      "assets/onboarding_slide_1.png",
      "assets/onboarding_slide_2.png",
      "assets/onboarding_slide_3.png"
    ];


    return Container(
      height: 0.6.sh,
      child: PageView.builder(
          controller: carouselController,
          itemCount: slideTitles.length,
          onPageChanged: (int index){
            setState(() {
              currentCarouselIndex = index;
            });
          },
          itemBuilder: (_, index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  fit: BoxFit.contain,
                  width: 0.3.sh,
                  height: 0.3.sh,
                  image: AssetImage(slideImages[index]),
                ),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(slideTitles[index], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 42), textAlign: TextAlign.start),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 0.8.sw,
                  child: Text(slideTexts[index], style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 14), textAlign: TextAlign.start,),
                ),
              ],
            );
          }
      ),
    );
  }

  Widget horizontalIndicators(count, selectedIndex){
    var dots = List<Widget>();
    for(int i = 0; i < count; i++){
      dots.add(Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: i == selectedIndex ? ThemeStyle.primaryColor : Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}