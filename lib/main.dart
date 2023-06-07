import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Weather/View/Home_screen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Home_screen(),
        },
      ),
    ),
  );
}
