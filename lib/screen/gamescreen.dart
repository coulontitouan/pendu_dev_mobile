import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:math';

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
    return niveauActuel+1;
  }

  void changerNiveau(int niveauF, bool value) {
    if (niveau.containsKey(niveauF)) {
      niveau[niveauF] = value;
    }
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

  final String? difficulte;
  Niveau({required this.difficulte});
  late final String mot = createMot(difficulte);
  late final String guess = createGuess(mot);

  createGuess(String mot){
    String res = '';
    for(int i=0; i<mot.length; i++) {
      res += '_ ';
    }
    return res;
  }
  createMot(String? difficulte) {
    int d = int.parse(difficulte!);
    List<String> mots = banqueDeMots[d] ?? [];
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
        ListView.builder(
          shrinkWrap: true,
          itemCount: partie.niveau.length,
          itemBuilder: (context, index) {
            bool niveauEstActif = partie.niveau[index + 1] ?? false;
            return ElevatedButton(
              onPressed: niveauEstActif
                  ? () {
                context.go("/game/$username/${partie.getNiveau(index)}");
              }
                  : null,
              child: Text('Niveau ${partie.getNiveau(index)}'),
            );
          },
        ),
      ],
    );
  }
}


class Niveauscreen extends StatelessWidget {
  final String? difficulte;
  Niveauscreen({super.key, required this.difficulte});
  late final Niveau niveau = Niveau(difficulte: difficulte);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
    Text('$difficulte , ${niveau.getMot()} :    ${niveau.getGuess()}'),

      ],
    );
  }}

