import 'package:flutter/material.dart';
import 'package:main_app/library.dart';

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
   return new HomeState();
  }
}

class HomeState extends State<MyApp>
{

  @override
  Widget build(BuildContext context)
  {
     return new MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Antara',
       home: Library(),
     ) ;
  }
}