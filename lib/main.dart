import 'dart:async';
import 'package:flutter/material.dart';
import 'package:main_app/homepage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) {
          return new HomePage();
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashState createState() {
    return new SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, nextPage);
  }

  void nextPage() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
