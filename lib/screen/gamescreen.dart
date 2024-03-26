import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:math';

class Partie {
  late final String? username;
  final List<Niveau> _ln = List.generate(10, (index) => Niveau(index + 1));

  static final Partie _instance = Partie._internal();

  factory Partie({required String? username}) {
    _instance.username = username; // Initialisation de la variable username de l'instance
    return _instance;
  }

  Partie._internal();

  List<Niveau> get niveaux => _ln;

  getNiveau(int niveauActuel) {
    return _ln[niveauActuel];
  }
}

class Niveau {
  static final Map<int, List<String>> banqueDeMots = {
    1: ['chat', 'sole', 'loup', 'pain', 'vent', 'peur', 'pied', 'roue', 'bout', 'clé', 'jour', 'ciel'],
    2: ['boue', 'robe', 'oiseau', 'fleur', 'marche', 'table', 'ciseau', 'corde', 'danse', 'globe', 'caillou', 'vache'],
    3: ['pomme', 'citron', 'jouet', 'plage', 'café', 'bruit', 'arbre', 'feuille', 'champ', 'soleil', 'lumière', 'fumée'],
    4: ['voiture', 'banane', 'château', 'fraise', 'dimanche', 'fusée', 'étoile', 'flamme', 'renard', 'église', 'courant', 'cercle'],
    5: ['ordinateur', 'maison', 'manger', 'école', 'dimanche', 'tortue', 'triangle', 'patinage', 'oiseleur', 'bougie', 'camarade', 'nuageux'],
    6: ['football', 'éléphant', 'jumelles', 'girafe', 'piscine', 'camion', 'écriture', 'girouette', 'moustache', 'nuisette', 'papillon', 'poussière'],
    7: ['chocolat', 'crocodile', 'chevalier', 'téléphone', 'horloge', 'cheminée', 'crayon', 'crème', 'salade', 'écureuil', 'parachute', 'sculpture'],
    8: ['grenouille', 'télévision', 'licorne', 'bicyclette', 'aventure', 'hôpital', 'cuisinière', 'brouillard', 'tonnerre', 'violoniste', 'xylophone', 'zoologie'],
    9: ['éléphantiasis', 'hippopotamus', 'labyrinthe', 'photographie', 'schématique', 'philosophie', 'astronomique', 'radiophonique', 'séismographie', 'ornithologie', 'technologie', 'élémentaire'],
    10: ['démocratique', 'électrocution', 'astronomique', 'détermination', 'émerveillement', 'microscopique', 'calamiteusement', 'congratulations', 'mélancoliquement', 'inévitablement', 'anticonstitutionnel', 'compréhensibilité'],
  };

  final int difficulte;
  Niveau(this.difficulte);
  late final String mot = createMot(difficulte);
  late final String guess = createGuess(mot);

  static createGuess(String mot){
    String res = '_';
    res *= mot.length;
  }
  static createMot(int difficulte) {
    List<String> mots = banqueDeMots[difficulte] ?? [];
    int indexAleatoire = Random().nextInt(mots.length);
    return mots[indexAleatoire];
  }

  getMot(){
    return mot;
  }
  getGuess(){
    return guess;
  }
}

class Gamescreen extends StatelessWidget {
  final String? username;
  final Partie partie;
  Gamescreen({Key? key, required this.username})
      : partie = Partie(username: username),
        super(key: key); // Initialisation de partie

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Salut $username'),
        Text('Niveau 1 : ${partie.getNiveau(1)}'),
      ],
    );
  }
}
