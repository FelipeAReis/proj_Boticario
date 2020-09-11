import 'package:flutter/material.dart';

class HomePagePost extends StatefulWidget {
  @override
  _HomePagePostState createState() => _HomePagePostState();
}

class _HomePagePostState extends State<HomePagePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        child: Column(children: <Widget>[

RaisedButton(
  child: Text("Ultimas Novidades"),
  onPressed: () => Navigator.of(context).pushNamed('/listLastestPage'))


        ],),
      ),


    );
  }
}
