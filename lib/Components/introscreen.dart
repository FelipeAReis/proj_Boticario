import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:proj_boticario/View/login_page.dart';
import 'package:proj_boticario/View/login_page_copy.dart';
import 'package:splashscreen/splashscreen.dart';

Widget introScreen(Size size) {
  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SplashScreen(
          seconds: 3,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffbaaacd),
              Color(0xff30106b),
            ],
          ),
          navigateAfterSeconds: LoginPageOther(),
          loaderColor: Colors.transparent,
        ),
        Container(
          width: size.width * 0.70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo_white.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    ),
  );
}
