import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/appimage.jpg'),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text('New here ?\nCreate an account!!', style: TextStyle(
                    color: Colors.white,
                    fontSize: 33.0,
                    fontFamily: 'Zen Dots',
                    fontWeight: FontWeight.w700,
                ),),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.28,
                      left: 35,
                      right: 35),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Enter name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      TextField(
                       // obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Enter college name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      TextField(
                        // obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Enter college email-id',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                      SizedBox(
                        height:35.0,
                      ),
                      TextField(
                        // obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Upload valid college id card',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                      SizedBox(
                        height:35.0,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Set password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                      SizedBox(
                        height:40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sign Up', style: TextStyle(
                            color: Colors.white,
                            fontSize: 27.0,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.orange,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, 'details');
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         /* TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password', style:
                            TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            ),
                          ),*/
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text('Back to login', style:
                            TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
  }

