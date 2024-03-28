import 'package:flutter/material.dart';

class ScreenRegles extends StatelessWidget {
  const ScreenRegles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Règles du Jeu - Juste Prix',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Le jeu du Juste Prix consiste à deviner le prix. Vous devez estimer un prix qui vous semble correct. Ensuite, vous recevrez des indications si votre estimation est trop élevée, trop basse ou si vous avez trouvé le prix exact. Bonne chance !",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
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
