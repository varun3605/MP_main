import 'package:sqflite/sqflite.dart';
import 'package:main_app/Basic_elements/song.dart';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseClient {
  Database _database;
  Song song;

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String databasepath = join(path.path, "database.db");
    _database =
    await openDatabase(databasepath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async
  {
    await db.execute("""
    CREATE TABLE songs(id NUMBER,title TEXT,duration NUMBER,albumArt TEXT,album TEXT,uri TEXT,artist TEXT,albumId NUMBER,isFav number NOT NULL default 0,timestamp number,count number not null default 0)
    """);
  }
}
