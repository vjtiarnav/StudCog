import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inheritance/configs/themes/app_colors.dart';
//import 'dart:html';
import 'package:inheritance/screens/decider_screen.dart';
//import 'package:inheritance/screens/signin_screen.dart';
//import 'package:inheritance/screens/signup_screen.dart';
//import 'package:inheritance/utils/colors_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => decider())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: mainGradient(context)),
            // begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                /* Image.asset(
                  'assets/images/logo2.png',
                  height: 250.0,
                  width: 250.0,
                ),
                const SizedBox(
                  height: 80,
                ),*/
                Text(
                  "StudCog",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontFamily: 'Unbounded',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            // CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
