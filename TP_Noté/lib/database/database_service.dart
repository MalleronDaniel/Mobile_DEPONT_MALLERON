import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database?> getDatabase() async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  static Future<Database> _initDatabase() async {
    var factory = databaseFactoryFfiWeb;
    var db = await factory.openDatabase('/lib/utils/database.db');
    var scoreDBExists = Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name='scores'",)) == 1;    if (scoreDBExists == false) {
      await db.execute('''CREATE TABLE IF NOT EXISTS scores (
      "pseudo" TEXT NOT NULL,
      "niveau" INT NOT NULL,
      "score" INT NOT NULL,
      PRIMARY KEY("pseudo", "niveau")
      );''');
    }
    return db;
  }
}