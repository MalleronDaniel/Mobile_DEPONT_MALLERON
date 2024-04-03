import 'package:td3/database/database_service.dart';
import 'package:td3/model/score.dart';

class ScoreDB {
  final String tableName = 'scores';


  Future<int> insert({required String pseudo, required int niveau, required int score}) async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    return await database!.rawInsert(
      '''INSERT INTO $tableName (pseudo, niveau, score) VALUES (?,?,?)''',
      [pseudo, niveau, score],
    );
  }

  Future<List<Score>> fetchAll() async {
    final database = await DatabaseService.getDatabase(); // Utilisation de getDatabase() plutôt que database
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    return List.generate(maps.length, (index) {
      return Score.fromSqFliteDataBase(maps[index]);
    });
  }
}
