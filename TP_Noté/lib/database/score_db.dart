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

  Future<int> insert({required String pseudo, required int niveau, required int score}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (pseudo, niveau, score) VALUES (?,?,?)''',
      [pseudo, niveau, score],
    );
  }

  Future<List<Score>> fetchAll() async {
    final database = await DatabaseService().database;
    final scores = await database.rawQuery(
      '''SELECT * from $tableName ORDER BY score ASC''');
    return scores.map((score) => Score.fromSqFliteDataBase(score)).toList();
  }
}
