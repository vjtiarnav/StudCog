import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:inheritance/screens/signin_screen.dart';
//import 'package:inheritance/screens/signup_screen.dart';
import 'package:inheritance/screens/splash_screen.dart';
//import 'package:flutter/src/rendering/box.dart';
//import 'package:inheritance/signup_screen.dart';
//import 'dart:html';
//import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
