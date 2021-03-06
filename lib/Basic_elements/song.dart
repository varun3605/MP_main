class Song {
  int id;
  String artist;
  String title;
  String album;
  int albumId;
  int duration;
  String Uri;
  String albumArt;

  Song(this.id, this.artist, this.title, this.album, this.albumId,
      this.duration, this.Uri, this.albumArt);

  Song.fromMap(Map m) {
    id = m["id"];
    artist = m["artist"];
    title = m["title"];
    album = m["album"];
    albumId = m["albumId"];
    duration = m["duration"];
    Uri = m["uri"];
    albumArt = m["albumArt"];
  }
}
