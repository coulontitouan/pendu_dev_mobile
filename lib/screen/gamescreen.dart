import 'dart:core';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class Partie {
  final String? username;
  late final Map<int, bool> niveau;
  late final niveauActuel;
  Partie({required this.username, required this.niveauActuel}) : niveau = _createNiveau();

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
  var niveau;
  Gamescreen({Key? key, required this.username, required dynamic niveau})
      : this.niveau = niveau,
        partie = niveau is int ? Partie(username: username, niveauActuel: niveau) : Partie(username: username, niveauActuel: 0),
        super(key: key);

  @override
  _GamescreenState createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  late String? username; //

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
        Container(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.partie.niveau.length,
            itemBuilder: (context, index) {
              final isEnabled = index < widget.niveau;

              return ElevatedButton(
                onPressed: isEnabled
                    ? () {
                  context.go(
                      "/game/${widget.username}/${widget.partie.getNiveau(index)}");
                }
                    : null,
                child: Text('Niveau ${widget.partie.getNiveau(index)}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
