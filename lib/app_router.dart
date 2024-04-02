import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:penduflutter/screen/niveauscreen.dart';
import 'package:penduflutter/screen/gamescreen.dart';
import 'package:penduflutter/screen/homescreen.dart';
import 'package:penduflutter/screen/rulescreen.dart';
import 'package:penduflutter/screen/scorescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: '/',
      redirect: (BuildContext context, GoRouterState state) => '/home',
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/rule",
      builder: (context, state) => const RuleScreen(),
    ),
    GoRoute(
      path: "/game/:username",
      builder: (context, state) {
        final username = state.pathParameters['username'];
        return Gamescreen(username: username);
      },
      routes: [
        GoRoute(
          path: ":niveau",
          builder: (context, state) {
            final niveau = state.pathParameters['niveau'];
            final username = state.pathParameters['username'];
            return Niveauscreen(difficulte: niveau,username: username);
          },
        ),
      ],
    ),
    GoRoute(
      path: "/score",
      builder: (context, state) => const Scorescreen(),
    ),
  ],
);
