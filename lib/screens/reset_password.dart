import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:html';
/*import 'package:firebase_signin/reusable_widgets/reusable_widget.dart';
import 'package:firebase_signin/screens/home_screen.dart';
import 'package:firebase_signin/utils/color_utils.dart';*/
import 'package:flutter/material.dart';
import 'package:inheritance/configs/themes/app_colors.dart';
import 'package:inheritance/reusable_widgets/reusable_widgets.dart';
//import 'package:inheritance/utils/colors_utils.dart';
//import 'dart:io';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: mainGradient(context)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebasebutton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ))),
    );
  }
}
