// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/themes_manager.dart';

class MyApp extends StatefulWidget {
  int appState = 0;

  MyApp._internal(); //private named constractor

  static final MyApp instance =
      MyApp._internal(); //single instance -- singletone

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
