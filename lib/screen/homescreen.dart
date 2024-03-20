import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("homeScreen")
      ),
      body: const Text("homeScreen"),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Rule"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Game"),
          BottomNavigationBarItem(icon: Icon(Icons.nature), label: "Score"),

        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
      ),
    );
  }


  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState
        .of(context)
        .uri
        .toString();
    if (location.startsWith("/rule")) {
      return 1;
    }
    if (location.startsWith("/game")) {
      return 2;
    }
    return 0;
  }


  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go("/rule");
      case 1:
        GoRouter.of(context).go("/game");
      case 2:
        GoRouter.of(context).go("/score");
    }
  }
}
