import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Le Juste Prix"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/home/Jouer'),
              child: const Text("Jouer"),
            ),
          ],
        ),
      ),
    );
  }
}
