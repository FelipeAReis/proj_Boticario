import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proj_boticario/View/login_page.dart';
import 'package:splashscreen/splashscreen.dart';

Widget introScreen(Size size) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff81C784),
            Color(0xff2E7D32),
          ],
        ),
        navigateAfterSeconds: LoginPage(),
        loaderColor: Colors.transparent,
      ),
      Container(
        width: size.width *0.70,
        child: Column(children: <Widget>[
        CircleAvatar(),
        Text("Felipe Adão Reis"),
        Text("felipe.digitalartes@hotmail.com")
      ],),),

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
  );
}
