
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
        title:"Flutter go rooter demo",
        theme: ThemeData(
          colorScheme : ColorScheme.fromSeed(seedColor:Colors.indigo),
          useMaterial3: true,
        ),
        routerConfig: router
    );
  }
}
