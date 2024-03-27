import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Le Juste Prix"),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.score),
            label: "Scores",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: "Jouer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: "Regles",
          ),
        ],
        currentIndex: _calculatorSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
      ),
    );
  }

  static int _calculatorSelectedIndex(BuildContext context) {
    final String location = GoRouterState
        .of(context)
        .uri
        .toString();
    if (location.startsWith("/home/Scores")) {
      return 0;
    }
    if (location.startsWith("/home/Jouer")) {
      return 1;
    }
    if (location.startsWith("/home/Regles")) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go("/home/Scores");
        break;

      case 1:
        GoRouter.of(context).go("/home/Jouer");
        break;

      case 2:
        GoRouter.of(context).go("/home/Regles");
        break;
    }
  }
}






