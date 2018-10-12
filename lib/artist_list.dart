import 'package:flutter/material.dart';

class ArtistList extends StatefulWidget
{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new _artistState();
    }
}

class _artistState extends State<ArtistList>
{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        body: Center(
          child: Text("In Artist"),
        ),
      );
    } 
}