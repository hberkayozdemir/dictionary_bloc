import 'package:dictionary_app_bloc/presentation/pages/home/home_page.dart';
import 'package:dictionary_app_bloc/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( home:Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.blue,
        splash: Image.asset(Helpers().ImagePath("gt.png")),
      ),
    ),);
  }
}
