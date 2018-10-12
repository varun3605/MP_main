import 'package:flutter/material.dart';

class TracksList extends StatefulWidget
{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _trackState();
    }
}

class _trackState extends State<TracksList>
{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        body: Center(
          child: Text("In Tracks"),
        ),
      );
    } 
}