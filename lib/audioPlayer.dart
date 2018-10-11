import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:main_app/Basic_elements/song.dart';

typedef void TimeHandler(Duration duration);
typedef void ErrorHandler(String message);

class AudioExtractor {
  static const MethodChannel _channel =
      const MethodChannel('com.hvr.mainapp/audiofinder');

  bool _Permissions = true;
  bool _PermissionGranted = true;

  TimeHandler durnHandler;
  TimeHandler poshandler;
  ErrorHandler errorHandler;
  VoidCallback startHandler;
  VoidCallback completeHandler;

  AudioExtractor() {
    _channel.setMethodCallHandler(audioCallHandler);
  }

  Future<dynamic> audioCallHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "media.duration":
        final duration = new Duration(milliseconds: methodCall.arguments);
        if (durnHandler != null) {
          durnHandler(duration);
        }
        break;

      case "media.onCurrentPosn":
        if (poshandler != null) {
          poshandler(new Duration(milliseconds: methodCall.arguments));
        }
        break;

      case "media.onStart":
        if (startHandler != null) startHandler();
        break;

      case "media.onComplete":
        if (completeHandler != null) {
          completeHandler();
        }
        break;

      case "media.onError":
        if (errorHandler != null) {
          errorHandler(methodCall.arguments);
        }
        break;

      default:
        print('Unknown method ${methodCall.method} ');
    }
  }

  void setDurnhandler(TimeHandler handler) {
    durnHandler = handler;
  }

  void setPoshandler(TimeHandler handler) {
    poshandler = handler;
  }

  void setStarthandler(VoidCallback callback) {
    startHandler = callback;
  }

  void setCompleteHandler(VoidCallback callback) {
    completeHandler = callback;
  }

  void setErrorhandler(ErrorHandler handler) {
    errorHandler = handler;
  }

  Future<dynamic> play(String uri, {bool isLocal: false}) {
    return _channel.invokeMethod('play', {"uri": uri, "isLocal": isLocal});
  }

  Future<dynamic> pause() {
    return _channel.invokeMethod('pause');
  }

  Future<dynamic> stop() {
    return _channel.invokeMethod('stop');
  }

  Future<dynamic> mute(bool muted) {
    return _channel.invokeMethod('mute', muted);
  }

  Future<dynamic> seek(double second) {
    return _channel.invokeMethod('seek', second);
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> requestPermission(int key) async
  {
    final String permission_rqst_status = await _channel.invokeMethod('request_permissions', {"status" : key});
    return permission_rqst_status;
  }

  static Future<String> openSettings() async
  {
    final String per_current_status = await _channel.invokeMethod('open_settings');
    return per_current_status;
  }
  static Future<dynamic> allSongs() async {
    var completer = new Completer();

    List<dynamic> songs = await _channel.invokeMethod('getSongs');
    print(songs.runtimeType);

    var allSongs = songs.map((m) {
      return new Song.fromMap(m);
    }).toList();

    completer.complete(allSongs);
    return completer.future;
  }
}
