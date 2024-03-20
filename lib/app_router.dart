import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:penduflutter/screen/gamescreen.dart";
import "package:penduflutter/screen/homescreen.dart";
import 'package:penduflutter/screen/rulescreen.dart';
import "package:penduflutter/screen/scorescreen.dart";

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation:"/home",
      routes: <RouteBase>[
        GoRoute(
            path: '/',
            redirect: (BuildContext context, GoRouterState state){
              return '/home';
            }
        ),
        GoRoute(
            path: "/home",
            name: "home",
            builder: (context,state) => const HomeScreen(),
                    ),
        GoRoute(
          path: "/rule",
          name: "rule",
          builder: (context,state) => const RuleScreen(),
        ),
        GoRoute(
          path: "/game",
          name: "game",
          builder: (context,state) => const Gamescreen(),
        ),
        GoRoute(
          path: "/score",
          name: "score",
          builder: (context,state) => const Scorescreen(),
        ),

      ]

  );



