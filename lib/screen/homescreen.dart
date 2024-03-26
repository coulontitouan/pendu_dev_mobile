import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("homeScreen"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final username = _usernameController.text.trim();
              if (username.isNotEmpty) {
                context.go("/game/$username"); // Adjusted route path
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter your username')),
                );
              }
            },
            child: const Text("Lancer une partie"),
          )
        ],
      ),
    );
  }
}
