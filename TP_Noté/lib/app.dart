import 'package:flutter/material.dart';
import 'package:td3/router/app_router.dart';


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: "Le Juste Prix de Samuel et Daniel",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent)
      ),
    routerConfig: router,
    );
  }
}