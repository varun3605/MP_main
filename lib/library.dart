import 'package:flutter/material.dart';
import 'dart:async';
import 'package:main_app/Database/database_client.dart';
import 'package:main_app/Basic_elements/song.dart';

class Library extends StatefulWidget {
  Library();

  List<Song> songs;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _libraryState();
  }
}

class _libraryState extends State<Library> {
  List<Song> songs;
  String primaryTitle = 'Antara';
  DatabaseClient databaseClient;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(

    );
  }

  void loadSongs() async
  {

  }

  void initPlayer() async
  {
    DatabaseClient databaseClient;
    await databaseClient.create();

  }
}

class TabItem {
  String title;
  IconData icon;
  TabItem(this.title, this.icon);
}
