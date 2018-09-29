import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:main_app/Basic_elements/song.dart';

class SongExtractor {
  static const MethodChannel _channel = const MethodChannel('song_extractor');
  bool _handlePermissions = true;
  bool _executeAfterPermissionGranted = true;

  SongExtractor() {
    //_channel.setMethodCallHandler(platformCallHandler);
  }

  static Future<dynamic> allSongs() async {
    var completer = new Completer();

    Map params = <String, dynamic>{
      "handlePermissions": true,
      "executeAfterPermissionGranted": true,
    };

    List<dynamic> songs = await _channel.invokeMethod('getSongs', params);
    print(songs.runtimeType);
    var mySongs = songs.map((m) => new Song.fromMap(m)).toList();
    completer.complete(mySongs);
    return completer.future;
  }
}
