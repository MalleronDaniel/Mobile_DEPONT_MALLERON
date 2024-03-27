import 'package:flutter/material.dart';
import 'package:td3/database/score_db.dart';
import 'package:td3/model/score.dart'; // Assurez-vous d'importer votre classe ScoreDB

class ScreenScore extends StatelessWidget {
  const ScreenScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
      body: FutureBuilder<List<Score>>(
        future: ScoreDB().fetchAll(), // Récupère les scores depuis la base de données
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Score> scores = snapshot.data!;
            return ListView.builder(
              itemCount: scores.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(scores[index].pseudo),
                  subtitle: Text('Niveau: ${scores[index].niveau.toString()}, Score: ${scores[index].score.toString()}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur de chargement des scores'),
            );
          }
          return Center(
            child: CircularProgressIndicator(), // Indicateur de chargement pendant le chargement des scores
          );
        },
      ),
    );
  }
}
