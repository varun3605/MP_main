import 'package:flutter/material.dart';
import 'audioPlayer.dart';
import 'album_list.dart';
import 'artist_list.dart';
import 'genre_list.dart';
import 'playlist_list.dart';
import 'track_list.dart';

var songs;

class TabPage extends StatefulWidget {
  TabPage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 5,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Library"),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(text: "Tracks"),
              new Tab(text: "Albums"),
              new Tab(text: "Artists"),
              new Tab(text: "Playlists"),
              new Tab(text: "Genres")
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new TracksList(),
            new AlbumsList(),
            new ArtistList(),
            new PlayList_List(),
            new GenreList()
          ],
        ),
      ),
    );
  }
}

void loadSongs() async {
  songs = await AudioExtractor.allSongs();
  print(songs);
}
