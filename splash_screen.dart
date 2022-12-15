import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 20),(){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>MyLogin(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.blueAccent,
        child: Center(
          child:Text('StudCog',style:TextStyle(
            fontFamily:'DiplomataSC',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          )
          )
        )
      )
    );
  }
}
