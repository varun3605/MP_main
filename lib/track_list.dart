import 'package:flutter/material.dart';
import 'dart:io';
import 'song_data.dart';

SongData songData;

class TracksList extends StatefulWidget {
  TracksList(@required SongData songDetail) {
    songData = songDetail;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _trackState();
  }
}

class _trackState extends State<TracksList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return /*new Text("abc"); */ new ListView.builder(
      itemCount: songData.list_song.length,
      itemBuilder: (context, int i) {
        var s = songData.list_song[i];
        var artFile =
            s.albumArt == null ? null : new File.fromUri(Uri.parse(s.albumArt));
        print(s);
        return new ListTile(
          leading: new Material(
            child: artFile != null
                ? Image.file(artFile, fit: BoxFit.cover,)
                : new CircleAvatar(
                    child: new Icon(Icons.play_circle_filled),
                  ),
          ),
          title: new Text(s.title),
          trailing: new IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: null,
          ),
        );
      },
    );
  }
}
