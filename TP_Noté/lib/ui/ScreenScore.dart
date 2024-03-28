import 'package:flutter/material.dart';
import 'package:td3/database/score_db.dart';
import 'package:td3/model/score.dart';

class ScreenScore extends StatelessWidget {
  const ScreenScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scores - Juste Prix',
          style: TextStyle(
            fontSize: 24.0, 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Score>>(
        future: ScoreDB().fetchAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Score> scores = snapshot.data!;
            return ListView.builder(
              itemCount: scores.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    scores[index].pseudo,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Niveau: ${scores[index].niveau.toString()}, Score: ${scores[index].score.toString()}',
                    style: const TextStyle(
                      fontSize: 16.0, 
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Erreur de chargement des scores',
                style: TextStyle(
                  fontSize: 20.0, 
                  color: Colors.red,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black, 
            ),
          );
        },
      ),
    );
  }
}
