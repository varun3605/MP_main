package com.hvr.mainapp;

import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {
    private static final String CHANNEL = "com.hvr.mainapp/audiofinder";
    private MethodChannel mMethodChannel;
    private Map<String, Object> argmnts;
    private boolean permissionGranted;
    private Result mResult;

    private static AudioManager sAudioManager;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

      mMethodChannel = new MethodChannel(getFlutterView(), CHANNEL);
      mMethodChannel.setMethodCallHandler(this);
      if (sAudioManager == null) {
          sAudioManager = (AudioManager) getApplicationContext().getSystemService(AUDIO_SERVICE);
      }
  }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        if (methodCall.method.equals("getPlatformVersion")) {
            result.success("Android" + Build.VERSION.RELEASE);
        } else if (methodCall.method.equals("getSongs")) {
            mResult = result;
            if (!(methodCall.arguments instanceof Map)) {
                throw new IllegalArgumentException("No Map Parameters found");
            }
            argmnts = (Map<String, Object>) methodCall.arguments;
            boolean permission = (boolean) argmnts.get("permissions");
            this.permissionGranted = (boolean) argmnts.get("permissionGranted");
            result.success(getSongData());
        } else {
            result.notImplemented();
        }
    }

    ArrayList<HashMap> getSongData() {
        AudioFinder audioFinder = new AudioFinder(getContentResolver());
        audioFinder.findSongs();
        List<Song> songList = audioFinder.getSongList();
        System.out.print(songList);
        ArrayList<HashMap> songHashMaps = new ArrayList<>();
        for (Song song : songList) {
            songHashMaps.add(song.toMap());
        }
        return songHashMaps;
    }

    @Override
    protected void onPostResume() {
        super.onPostResume();
        System.out.print("In Post Resume");
    }
}
