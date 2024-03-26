import 'package:sqflite/sqflite.dart';
import 'package:td3/database/database_service.dart';
import 'package:td3/model/score.dart';

class ScoreDB {
  final tableName = 'scores';
  
  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "pseudo" TEXT NOT NULL,
    "niveau" INT NOT NULL,
    "score" INT NOT NULL,
    PRIMARY KEY("pseudo", "niveau")
    );""");
  }
}
