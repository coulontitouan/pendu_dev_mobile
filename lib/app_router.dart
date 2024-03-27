import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:penduflutter/screen/gamescreen.dart';
import 'package:penduflutter/screen/homescreen.dart';
import 'package:penduflutter/screen/rulescreen.dart';
import 'package:penduflutter/screen/scorescreen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// Définir le routeur global
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (BuildContext context, GoRouterState state){
        return '/home';
      },
    ),
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/rule",
      name: "rule",
      builder: (context, state) => const RuleScreen(),
    ),
    GoRoute(
      path: "/game/:username", // Chemin mis à jour pour inclure le paramètre dynamique username
      name: "game",
      builder: (context, state) {
        // Récupérer le paramètre username de l'URL
        final username = state.pathParameters['username'];

        // Passer le username à la construction de Gamescreen
        return Gamescreen(username: username);
      },
      routes: [
        GoRoute(path: ":Niveau",
        name: 'Niveau',
            parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state){
          final niveauActuel = state.pathParameters['Niveau'];
          return Niveauscreen(difficulte : niveauActuel);
        }),
      ],
    ),
    GoRoute(
      path: "/score",
      name: "score",
      builder: (context, state) => const Scorescreen(),
    ),
  ],
);

