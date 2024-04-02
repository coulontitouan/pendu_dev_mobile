import 'dart:math';
import 'package:flutter/material.dart';

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
  String mot = '';
  String guess = '';
  int counter = 0;
  final BuildContext context;

  Niveau({required this.difficulte, required this.context}) {
    mot = createMot(difficulte);
    guess = createGuess(mot);
  }

  String createGuess(String mot) {
    String res = '';
    for(int i = 0; i < mot.length; i++) {
      res += '_';
    }
    return res;
  }

  String createMot(String? difficulte) {
    int d = int.parse(difficulte!);
    List<String> mots = banqueDeMots[d] ?? [];
    int indexAleatoire = Random().nextInt(mots.length);
    return mots[indexAleatoire];
  }

  int dansLeMot(String lettre) {
    if (mot.contains(lettre)) {
      return 0;
    } else {
      return 1;
    }
  }

  void updateGuess(String lettre) {
    String newGuess = '';
    for(int i = 0; i < mot.length; i++) {
      if (mot[i] == lettre) {
        newGuess += lettre;
      } else {
        newGuess += guess[i];
      }
    }
    guess = newGuess;
    counter += dansLeMot(lettre);

    if (guess == mot) {
      // Afficher un message de félicitations avec une boîte de dialogue
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bravo!'),
            content: Text('Vous avez deviné le mot.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context, true); // Retourne true pour indiquer que le niveau a été réussi
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

class Niveauscreen extends StatefulWidget {
  final String? difficulte;
  Niveauscreen({Key? key, required this.difficulte, required this.niveauReussi}) : super(key: key);

  @override
  _NiveauscreenState createState() => _NiveauscreenState();
}

class _NiveauscreenState extends State<Niveauscreen> {
  late final Niveau niveau;

  @override
  void initState() {
    super.initState();
    niveau = Niveau(difficulte: widget.difficulte!, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Niveau'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: ${niveau.counter}'),
              ],
            ),
            SizedBox(height: 20),
            Text('${widget.difficulte}, ${niveau.mot} : ${niveau.guess}'),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                26,
                    (index) {
                  String letter = String.fromCharCode('a'.codeUnitAt(0) + index);
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: widget.niveauReussi == true ? null : () {
                        setState(() {
                          niveau.updateGuess(letter);
                        });
                      },
                      child: Text(letter),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Partie {
  final String? username;
  int niveauActuel = 1; // Niveau actuel
  List<Niveau> niveauxReussis = [];
  Partie({required this.username});

  void niveauSuivant() {
    if (niveauActuel < 10) {
      niveauActuel++;
      Niveau n= niveauxReussis[niveauActuel]
    }
  }
}

class Accueil extends StatefulWidget {
  Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom d\'utilisateur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Niveaux(username: _usernameController.text),
                      ),
                    );
                  }
                },
                child: Text('Commencer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Niveaux extends StatefulWidget {
  final String? username;
  Niveaux({Key? key, required this.username}) : super(key: key);

  @override
  _NiveauxState createState() => _NiveauxState();
}

class _NiveauxState extends State<Niveaux> {
  late final Partie partie;

  @override
  void initState() {
    super.initState();
    partie = Partie(username: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Niveaux'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            int niveauActuel = index + 1;
            return ListTile(
              title: Text('Niveau $niveauActuel'),
              trailing: partie.niveauxReussis[niveauActuel] == true
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : null,
              onTap: () {
                if (partie.niveauxReussis[niveauActuel - 1] == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Niveauscreen(
                        difficulte: niveauActuel.toString(),
                        niveauReussi: partie.niveauxReussis[niveauActuel],
                      ),
                    ),
                  ).then((niveauReussi) {
                    if (niveauReussi == true) {
                      setState(() {
                        partie.niveauSuivant();
                      });
                    }
                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Accueil(),
    },
  ));
}
