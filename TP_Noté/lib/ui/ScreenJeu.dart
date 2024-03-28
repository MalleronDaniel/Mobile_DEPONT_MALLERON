import 'package:flutter/material.dart';
import 'dart:math';

import 'package:td3/database/score_db.dart';

class ScreenJeu extends StatefulWidget {
  const ScreenJeu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenJeuState createState() => _ScreenJeuState();
}

class _ScreenJeuState extends State<ScreenJeu> {
  // Déclarations des variables
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final Random _random = Random();
  late int _targetPrice;
  String _feedback = '';
  int _triesLeft = 0;
  bool _gameStarted = false;

  // Méthodes de gestion du jeu
  void _startGame(int level) {
    setState(() {
      _gameStarted = true;
      _generateTargetPrice(level);
    });
  }

  void _generateTargetPrice(int level) {
    int minPrice, maxPrice, maxTries;
    switch (level) {
      case 1:
        minPrice = 0;
        maxPrice = 100;
        maxTries = 30;
        break;
      case 2:
        minPrice = 0;
        maxPrice = 1000;
        maxTries = 15;
        break;
      case 3:
        minPrice = 0;
        maxPrice = 5000;
        maxTries = 10;
        break;
      default:
        minPrice = 0;
        maxPrice = 100;
        maxTries = 30;
    }
    _targetPrice = minPrice + _random.nextInt(maxPrice - minPrice + 1);
    _feedback = 'Le prix à deviner est entre $minPrice et $maxPrice.';
    _triesLeft = maxTries;
  }

  void _checkPrice(int guessedPrice) {
    setState(() {
      _triesLeft--;
      if (_triesLeft == 0) {
        _feedback = 'Game Over. Le chiffre à deviner était $_targetPrice.';
      } else if (guessedPrice > _targetPrice) {
        _feedback = 'Le Chiffre est trop haut ! Essais restants : $_triesLeft';
      } else if (guessedPrice < _targetPrice) {
        _feedback = 'Le Chiffre est trop bas ! Essais restants : $_triesLeft';
      } else {
        _feedback = 'Vous avez Gagné !';
        _saveScore();
      }
    });
  }

  // Méthode pour enregistrer le score dans la base de données
  Future<void> _saveScore() async {
    int initialTries;
    switch (_getSelectedLevel()) {
      case 1:
        initialTries = 30;
        break;
      case 2:
        initialTries = 15;
        break;
      case 3:
        initialTries = 10;
        break;
      default:
        initialTries = 30;
    }

    int score = initialTries - _triesLeft;

    await ScoreDB().insert(
      pseudo: _nameController.text,
      niveau: _getSelectedLevel(),
      score: score,
    );
  }

  // Méthodes utilitaires
  int _getSelectedLevel() {
    if (_targetPrice >= 0 && _targetPrice <= 100) {
      return 1;
    } else if (_targetPrice > 100 && _targetPrice <= 1000) {
      return 2;
    } else {
      return 3;
    }
  }

  void _resetGame() {
    setState(() {
      _gameStarted = false;
      _feedback = '';
      _nameController.clear();
      _priceController.clear();
    });
  }

  // Méthode de construction de l'interface utilisateur
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jeu - Juste Prix',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold, 
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: _gameStarted
              ? _buildGameUI()
              : _buildStartUI(),
        ),
      ),
    );
  }

  // Construction de l'interface utilisateur pour le jeu
  Widget _buildGameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _feedback,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Entrez votre estimation',
                ),
                onChanged: (value) {
                },
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                if (_priceController.text.isNotEmpty) {
                  int? guessedPrice = int.tryParse(_priceController.text);
                  if (guessedPrice != null) {
                    _checkPrice(guessedPrice);
                  }
                }
              },
              child: const Text('Valider'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (_feedback == 'Vous avez Gagné !' || _triesLeft == 0)
          ElevatedButton(
            onPressed: () {
              _resetGame();
            },
            child: const Text('Revenir à l\'accueil'),
          ),
      ],
    );
  }

  // Construction de l'interface utilisateur pour le démarrage du jeu
  Widget _buildStartUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Entrez votre prénom',
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.isNotEmpty) {
              _showLevelDialog();
            }
          },
          child: const Text('Choisir le Niveau'),
        ),
      ],
    );
  }

  // Affichage de la boîte de dialogue pour choisir le niveau
  void _showLevelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choisir le Niveau'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _startGame(1); // Niveau 1
                  Navigator.pop(context); // Ferme la boîte de dialogue
                },
                child: const Text('Niveau 1 (0-100)'),
              ),
              ElevatedButton(
                onPressed: () {
                  _startGame(2); // Niveau 2
                  Navigator.pop(context); // Ferme la boîte de dialogue
                },
                child: const Text('Niveau 2 (0-1000)'),
              ),
              ElevatedButton(
                onPressed: () {
                  _startGame(3); // Niveau 3
                  Navigator.pop(context); // Ferme la boîte de dialogue
                },
                child: const Text('Niveau 3 (0-5000)'),
              ),
            ],
          ),
        );
      },
    );
  }
}
