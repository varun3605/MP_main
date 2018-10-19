package com.hvr.mainapp;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class AudioFinder {
    private ContentResolver mContentResolver;
    private List<Song> mSongList = new ArrayList<>();
    private Random mRandom = new Random();

    public AudioFinder(ContentResolver contentResolver) {
        mContentResolver = contentResolver;
    }

    public void findSongs() {
        Uri songUri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;

        Cursor songListCursor = mContentResolver.query(songUri, null, MediaStore.Audio.Media.IS_MUSIC + "=1", null, null);

        if (songListCursor == null)
            return;

        if (!songListCursor.moveToFirst())
            return;

        int idCol = songListCursor.getColumnIndex(MediaStore.Audio.Media._ID);
        int titleCol = songListCursor.getColumnIndex(MediaStore.Audio.Media.TITLE);
        int artistCol = songListCursor.getColumnIndex(MediaStore.Audio.Media.ARTIST);
        int albumCol = songListCursor.getColumnIndex(MediaStore.Audio.Media.ALBUM);
        int durationCol = songListCursor.getColumnIndex(MediaStore.Audio.Media.DURATION);
        int albumArtCol = songListCursor.getColumnIndex(MediaStore.Audio.Media.ALBUM_ID);

        do {
            mSongList.add(new Song(
                    songListCursor.getLong(idCol),
                    songListCursor.getString(artistCol),
                    songListCursor.getString(titleCol),
                    songListCursor.getString(albumCol),
                    songListCursor.getLong(albumArtCol),
                    songListCursor.getLong(durationCol),
                    mContentResolver
            ));


        } while (songListCursor.moveToNext());

        songListCursor.close();
    }

    public Song RandomSong() {
        if (mSongList.size() <= 0)
            return null;
        return mSongList.get(mRandom.nextInt(mSongList.size()));
    }

    public List<Song> getSongList() {
        return mSongList;
    }
}