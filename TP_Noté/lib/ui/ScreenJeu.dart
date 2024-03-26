import 'package:flutter/material.dart';
import 'dart:math';

class ScreenJeu extends StatefulWidget {
  const ScreenJeu({Key? key}) : super(key: key);

  @override
  _ScreenJeuState createState() => _ScreenJeuState();
}

class _ScreenJeuState extends State<ScreenJeu> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final Random _random = Random();
  late int _targetPrice;
  String _feedback = '';
  bool _gameStarted = false;

  void _startGame() {
    setState(() {
      _gameStarted = true;
      _generateTargetPrice();
    });
  }

  void _generateTargetPrice() {
    _targetPrice = _random.nextInt(1001);
    _feedback = 'Le prix à deviner est entre 0 et 1000.';
  }

  void _checkPrice(int guessedPrice) {
    if (guessedPrice > _targetPrice) {
      setState(() {
        _feedback = 'Trop haut !';
      });
    } else if (guessedPrice < _targetPrice) {
      setState(() {
        _feedback = 'Trop bas !';
      });
    } else {
      setState(() {
        _feedback = 'Gagné !';
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu - Le Juste Prix'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: _gameStarted
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _feedback,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Entrez votre estimation',
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    int? guessedPrice = int.tryParse(value);
                    if (guessedPrice != null) {
                      _checkPrice(guessedPrice);
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              if (_feedback != 'Gagné !')
                Text(
                  'Le prix à deviner est entre 0 et 1000.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              if (_feedback == 'Gagné !')
                ElevatedButton(
                  onPressed: () {
                    _resetGame();
                  },
                  child: Text('Revenir à l\'accueil'),
                ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Entrez votre prénom',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    _startGame();
                  }
                },
                child: Text('Lancer le Jeu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

