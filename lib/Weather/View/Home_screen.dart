import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

import 'package:weather_app/Weather/Provider/Weather_provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  WetherProvider? providerF;
  WetherProvider? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<WetherProvider>(context, listen: false).apiDataParsing();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<WetherProvider>(context, listen: false);
    providerT = Provider.of<WetherProvider>(context, listen: true);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          // body: providerT!.w1 == null
          //     ? Center(child: CircularProgressIndicator())
          //     :
          body: Stack(
            children: [
              //image
              Container(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  "assets/image/bg.png",
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(100),
                ),
              ),
              //weather
              //city
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: providerT!.cityList
                            .map((e) => DropdownMenuItem(
                                  child: Text(
                                    "$e",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        hint: Text(
                          "${providerT!.city}",
                          style: TextStyle(color: Colors.white),
                        ),
                        dropdownColor: Colors.white10,
                        elevation: 0,
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        onChanged: (value) {
                          providerF!.changeCity(value as String);
                        },
                      ),
                    )),
              ),
              //temperature
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "${providerF!.w1.main!.temp!-273}\u00b0",
                    style: TextStyle(fontSize: 100, color: Colors.white),
                  ),
                ),
              ),
              //mosam
              Padding(
                padding: const EdgeInsets.only(top: 230),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "sunny",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              //H/L
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "H : 27\u00B0  L : 18\u00b0",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),

              //bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    border: Border.all(color: Colors.white, width: 3),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      //button
                      SizedBox(height: 10),
                      Container(
                        height: 0.8.h,
                        width: 13.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black45,
                        ),
                      ),
                      //tabBar
                      TabBar(
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(
                            child: Text(
                              "Hourly Forecast",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Weekly Forecast",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 2,
                        color: Colors.white,
                      ),
                      //weather
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          temperature(
                              "12 PM", "assets/image/sun.png", "27\u00b0"),
                          temperature(
                              "NOW", "assets/image/sun.png", "27\u00b0"),
                          temperature(
                              "12 PM", "assets/image/sun.png", "27\u00b0"),
                          temperature(
                              "12 PM", "assets/image/sun.png", "27\u00b0"),
                          temperature(
                              "12 PM", "assets/image/sun.png", "27\u00b0"),
                        ],
                      ),
                      //option
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.map_outlined,
                                color: Colors.white,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.hdr_weak_outlined,
                                color: Colors.white,
                                size: 25,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.list,
                                color: Colors.white,
                                size: 35,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget temperature(String time, String img, String temp) {
    return Container(
      height: 20.h,
      width: 16.w,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: Colors.teal.shade200,
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //time
          Text(
            "$time",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          //image
          Image.asset("$img"),
          //temperature
          Text(
            "$temp",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
