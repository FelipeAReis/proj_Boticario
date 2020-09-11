import 'package:flutter/material.dart';
import 'package:proj_boticario/View/home_page_post.dart';
import 'package:proj_boticario/View/list_lastest_page.dart';
import 'package:proj_boticario/View/login_newuser_page.dart';
import 'Components/introscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boticario App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Splash Screen',),

      routes: <String, WidgetBuilder> {
      '/homePage'     : (BuildContext context) => HomePagePost(),
      '/loginNewUserPage' : (BuildContext context) => new LoginNewUserPage(),
      '/listLastestPage' : (BuildContext context) => new ListLastestPage(),


     
    },
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return introScreen(size);
  }
}


