import 'package:flutter/material.dart';
import 'dart:async';
import 'audioPlayer.dart';
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
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSongs();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(

    );
  }

  void loadSongs() async
  {
    var songs = await AudioExtractor.allSongs();
    print(songs);
    var version = await AudioExtractor.platformVersion;
    print(version);
  }

}
