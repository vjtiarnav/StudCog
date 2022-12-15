import 'package:flutter/material.dart';
import 'package:flutter_app/3rdpage.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/register.dart';
import 'package:flutter_app/splash_screen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  initialRoute: 'login',
  routes: {
    'login': (context)=>MyLogin(),
    'register':(context)=>MyRegister(),
    'details':(context)=>MyDetails(),
  },
  ));
}
class flutter_app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyLogin(),

    );
  }
}
