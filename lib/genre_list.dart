import 'package:flutter/material.dart';

class GenreList extends StatefulWidget
{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _GenreState();
    }
}

class _GenreState extends State<GenreList>
{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        body: Center(
          child: Text("In Genre"),
        ),
      );
    } 
}