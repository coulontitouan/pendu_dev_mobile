import 'package:flutter/material.dart';

class Partie {
  late final String? username;
  final List<Niveau> _ln = List.generate(10, (index) => Niveau(index + 1)); //
  static final Partie _instance = Partie._internal();

  factory Partie({required String? username}) {
    return _instance..username = username;
  }

  Partie._internal();

  List<Niveau> get niveaux => _ln;
}

class Niveau {
  static final Map<int, List<String>> banqueDeMots = {
    1: ['chat', 'sole', 'loup', 'pain', 'vent', 'peur', 'pied', 'roue', 'bout', 'clé', 'jour', 'ciel'],
    2: ['boue', 'robe', 'oiseau', 'fleur', 'marche', 'table', 'ciseau', 'corde', 'danse', 'globe', 'caillou', 'vache'],
    3: ['pomme', 'citron', 'jouet', 'plage', 'café', 'bruit', 'arbre', 'feuille', 'champ', 'soleil', 'lumière', 'fumée'],
    6: ['voiture', 'banane', 'château', 'fraise', 'dimanche', 'fusée', 'étoile', 'flamme', 'renard', 'église', 'courant', 'cercle'],
    7: ['ordinateur', 'maison', 'manger', 'école', 'dimanche', 'tortue', 'triangle', 'patinage', 'oiseleur', 'bougie', 'camarade', 'nuageux'],
    8: ['football', 'éléphant', 'jumelles', 'girafe', 'piscine', 'camion', 'écriture', 'girouette', 'moustache', 'nuisette', 'papillon', 'poussière'],
    9: ['chocolat', 'crocodile', 'chevalier', 'téléphone', 'horloge', 'cheminée', 'crayon', 'crème', 'salade', 'écureuil', 'parachute', 'sculpture'],
    10: ['grenouille', 'télévision', 'licorne', 'bicyclette', 'aventure', 'hôpital', 'cuisinière', 'brouillard', 'tonnerre', 'violoniste', 'xylophone', 'zoologie'],
    11: ['éléphantiasis', 'hippopotamus', 'labyrinthe', 'photographie', 'schématique', 'philosophie', 'astronomique', 'radiophonique', 'séismographie', 'ornithologie', 'technologie', 'élémentaire'],
    12: ['démocratique', 'électrocution', 'astronomique', 'détermination', 'émerveillement', 'microscopique', 'calamiteusement', 'congratulations', 'mélancoliquement', 'inévitablement', 'anticonstitutionnel', 'compréhensibilité'],
    13: ['inintelligible', 'anticonstitutionnellement', 'irréversible', 'irrémédiablement', 'incompréhensiblement', 'inaccessibilité', 'inégalités', 'incompatibilités', 'indispensabilité', 'intelligentsia', 'interventionnisme', 'introspection'],
  };

  final int difficulte;
  Niveau(this.difficulte);
  late final mot = getMot(difficulte);

  static getMot(int difficulte) {}
}

class Gamescreen extends StatelessWidget {
  final String? username;
  const Gamescreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
   return Text('Salut $username');
  }
}
