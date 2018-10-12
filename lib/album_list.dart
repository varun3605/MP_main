import 'package:flutter/material.dart';

class AlbumsList extends StatefulWidget
{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _albumState();
    }
}

class _albumState extends State<AlbumsList>
{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        body: Center(
          child: Text("In Album"),
        ),
      );
    } 
}