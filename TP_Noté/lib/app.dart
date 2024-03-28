import 'package:flutter/material.dart';
import 'package:td3/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Le Juste Prix de Samuel et Daniel",
      routerConfig: router,
    );
  }
}
