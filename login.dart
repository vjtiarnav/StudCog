import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/appimage.jpg'),
          fit: BoxFit.cover
        )
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left:35,top:100),
              child:Text('Welcome Back!!!\n\n\nLogin',style:TextStyle(
                color:Colors.white,
                fontSize: 40.0,
                fontFamily: 'Zen Dots',
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.40,
                left:35,
                right:35),
                child:Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                    ),
                    SizedBox(
                      height:30,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
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
                      /*  Text('Log in',style: TextStyle(
                          color: Colors.white,
                          fontSize: 27.0,
                          fontWeight: FontWeight.w700,
                        ),
                        ),*/
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.orange,
                          child: IconButton(
                            color:Colors.white,
                              onPressed: (){
                                Navigator.pushNamed(context, 'details');
                              },
                              icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height:70.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Text('Forgot Password',style:
                            TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text('Sign Up',style:
                          TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
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
