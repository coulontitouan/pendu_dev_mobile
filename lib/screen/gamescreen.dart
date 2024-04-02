import 'dart:core';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class Partie {
  final String? username;
  late final Map<int, bool> niveau;

  Partie({required this.username}) : niveau = _createNiveau();

  static Map<int, bool> _createNiveau() {
    Map<int, bool> niveau = {};
    for (int i = 1; i <= 10; i++) {
      niveau[i] = i == 1;
    }
    return niveau;
  }

  getNiveau(int niveauActuel) {
    return niveauActuel + 1;
  }

  void changerNiveau(int niveauF, bool value) {
    if (niveau.containsKey(niveauF)) {
      niveau[niveauF] = value;
    }
  }

  void updateNiveau(int niveauF) {
    if (niveau.containsKey(niveauF + 1)) {
      niveau[niveauF + 1] = true;
    }
  }
}
class Gamescreen extends StatefulWidget {
  final String? username;
  final Partie partie;

  Gamescreen({Key? key, required this.username})
      : partie = Partie(username: username),
        super(key: key); // Initialisation de partie

  @override
  _GamescreenState createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  late String? username; // Initialisez la variable username

  @override
  void initState() {
    super.initState();
    username = widget.username; // Initialisez username dans la méthode initState
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Salut ${widget.username}'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.partie.niveau.length,
          itemBuilder: (context, index) {
            bool niveauEstActif = widget.partie.niveau[index + 1] ?? false;
            return ElevatedButton(
              onPressed: niveauEstActif
                  ? () {
                context.go(
                    "/game/${widget.username}/${widget.partie.getNiveau(index)}");
              }
                  : null,
              child: Text('Niveau ${widget.partie.getNiveau(index)}'),
            );
          },
        ),
      ],
    );
  }
}
