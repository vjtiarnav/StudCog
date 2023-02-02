import 'package:flutter/material.dart';
import 'package:inheritance/configs/themes/app_colors.dart';
import 'package:inheritance/reusable_widgets.dart';
import 'package:inheritance/screens/official_signin_screen.dart';
import 'package:inheritance/screens/signin_screen.dart';
//import 'package:inheritance/utils/colors_utils.dart';
//import 'dart:io';

class decider extends StatefulWidget {
  const decider({super.key});

  @override
  State<decider> createState() => _deciderState();
}

class _deciderState extends State<decider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: mainGradient(context)),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                        child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        logoWidget("assets/images/logo2.png"),
                                        const SizedBox(
                                          height: 55,
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "A one-stop solution \nto all your\n college-related problems",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily: 'Unbounded',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 55,
                                        ),
                                        ElevatedButton(
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignInScreen()));
                                          }),
                                          child: Text(
                                            "You are a student",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: 'Unbounded',
                                            ),
                                          ),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) {
                                                if (states.contains(
                                                    MaterialState.pressed)) {
                                                  return Colors.grey;
                                                }
                                                return Colors.white;
                                              })),
                                        ),
                                        const SizedBox(
                                          height: 55,
                                        ),
                                        ElevatedButton(
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OfficialSignInScreen()));
                                          }),
                                          child: Text(
                                            "You are an official",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: 'Unbounded',
                                            ),
                                          ),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) {
                                                if (states.contains(
                                                    MaterialState.pressed)) {
                                                  return Colors.grey;
                                                }
                                                return Colors.white;
                                              })),
                                        ),
                                      ],
                                    )))))))));
  }
}
/*{
  "project_info": {
    "project_number": "696399696409",
    "project_id": "studcog-48606",
    "storage_bucket": "studcog-48606.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:696399696409:android:b7eced65ec97a249a79088",
        "android_client_info": {
          "package_name": "com.example.inheritance"
        }
      },
      "oauth_client": [
        {
          "client_id": "696399696409-gdaalaf0fdlidqm0t72tqpobb6g21e5f.apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "AIzaSyCvhogMy3-XHYLNJhhF3swgYiRhE7TE7oI"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "696399696409-gdaalaf0fdlidqm0t72tqpobb6g21e5f.apps.googleusercontent.com",
              "client_type": 3
            }
          ]
        }
      }
    }
  ],
  "configuration_version": "1"
}

{
  "project_info": {
    "project_number": "696399696409",
    "project_id": "studcog-48606",
    "storage_bucket": "studcog-48606.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:696399696409:android:b7eced65ec97a249a79088",
        "android_client_info": {
          "package_name": "com.example.inheritance"
        }
      },
      "oauth_client": [
        {
          "client_id": "696399696409-lmu1m8egpnnt5j2rljv2fgdr0j3jcer6.apps.googleusercontent.com",
          "client_type": 1,
          "android_info": {
            "package_name": "com.example.inheritance",
            "certificate_hash": "7f02b9366f231853d39ceec3f165c33407670c10"
          }
        },
        {
          "client_id": "696399696409-59l698kte2ssg9novmj8mht3olu6r338.apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "AIzaSyCvhogMy3-XHYLNJhhF3swgYiRhE7TE7oI"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "696399696409-59l698kte2ssg9novmj8mht3olu6r338.apps.googleusercontent.com",
              "client_type": 3
            }
          ]
        }
      }
    }
  ],
  "configuration_version": "1"
}*/


/*{
  "project_info": {
    "project_number": "696399696409",
    "project_id": "studcog-48606",
    "storage_bucket": "studcog-48606.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:696399696409:android:b7eced65ec97a249a79088",
        "android_client_info": {
          "package_name": "com.example.inheritance"
        }
      },
      "oauth_client": [
        {
          "client_id": "696399696409-lmu1m8egpnnt5j2rljv2fgdr0j3jcer6.apps.googleusercontent.com",
          "client_type": 1,
          "android_info": {
            "package_name": "com.example.inheritance",
            "certificate_hash": "7f02b9366f231853d39ceec3f165c33407670c10"
          }
        },
        {
          "client_id": "696399696409-59l698kte2ssg9novmj8mht3olu6r338.apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "AIzaSyCvhogMy3-XHYLNJhhF3swgYiRhE7TE7oI"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "696399696409-59l698kte2ssg9novmj8mht3olu6r338.apps.googleusercontent.com",
              "client_type": 3
            }
          ]
        }
      }
    }
  ],
  "configuration_version": "1"
}*/