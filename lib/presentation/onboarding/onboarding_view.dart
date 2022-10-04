// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/colors_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
