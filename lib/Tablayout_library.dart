import 'package:flutter/material.dart';
import 'album_list.dart';
import 'artist_list.dart';
import 'genre_list.dart';
import 'playlist_list.dart';
import 'track_list.dart';
import 'song_data.dart';
import 'audioPlayer.dart';


var songs;
SongData songData;
bool isLoading;

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
    isLoading = true;
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
        body: isLoading ? new CircularProgressIndicator() : new TabBarView(
          children: <Widget>[
            new TracksList(songData),
            new AlbumsList(),
            new ArtistList(),
            new PlayList_List(),
            new GenreList()
          ],
        ),
      ),
    );
  }

   void loadSongs() async {
    songs = await AudioExtractor.allSongs();
    print(songs);
    if(!mounted)
        return;

    setState(() {
          songData = new SongData(songs);
          isLoading = false;
        });
  }
}
