import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proj_boticario/View/login_page.dart';


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
              Color.fromRGBO(111, 117, 226, 1),
              Color.fromRGBO(141, 156, 199, 1),
              //Color(0xffc6adf1),
             // Color(0xff003fcd),              
            ],
          ),
          navigateAfterSeconds: LoginPage(),
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
