import 'package:flutter/material.dart';

class ScreenRegles extends StatelessWidget {
  const ScreenRegles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Règles du Jeu - Juste Prix'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20),
              Text(
                "Le jeu du Juste Prix consiste à deviner le prix. Vous devez estimer un prix qui vous semble correct. Ensuite, vous recevrez des indications si votre estimation est trop élevée, trop basse ou si vous avez trouvé le prix exact. Bonne chance !",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}