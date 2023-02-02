/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/screens/signin_screen.dart';*/
//import 'dart:ffi';
//import 'dart:html';
//import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inheritance/configs/themes/app_colors.dart';
import 'package:inheritance/read%20data/get_user_name.dart';
import 'package:inheritance/screens/signin_screen.dart';
import 'package:inheritance/services/firebase_services.dart';
//import 'package:inheritance/utils/colors_utils.dart';
//import 'package:flutter/src/rendering/box.dart';
//import 'package:url_launcher_web/url_launcher_web.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class OfficialHomeScreen extends StatefulWidget {
  const OfficialHomeScreen({Key? key}) : super(key: key);

  @override
  _OfficialHomeScreenState createState() => _OfficialHomeScreenState();
}

class _OfficialHomeScreenState extends State<OfficialHomeScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  String imageUrl = '';
  String College = '';
  String Detailed_complaint = '';
  String Area_of_Complaint = '';
  List<String> docIDs = [];
  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('student')
        .orderBy('College', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  /* void initState() {
    getDocID();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Official Portal",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Unbounded'),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.black),
            child: PopupMenuButton<int>(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL!),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child:
                      Text("${FirebaseAuth.instance.currentUser!.displayName}"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("${FirebaseAuth.instance.currentUser!.email}"),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 3,
                  child: ElevatedButton(
                      //  child: Text("Logout"),
                      onPressed: () async {
                        await FirebaseServices().signOut();

                        FirebaseAuth.instance.signOut().then((value) {
                          print("Signed Out Succesfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "Logout",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                ),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ),
        ],
      ),
      /*  body: Container(
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FCD703"),
          hexStringToColor("FB8C00"),
          hexStringToColor("EF6C00")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        
        child: Text(
          "\n\nHello ${FirebaseAuth.instance.currentUser!.displayName}!!\nRegister a Complaint",
          style: TextStyle(
            fontFamily: "Unbounded",
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),*/
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Column(
            children: <Widget>[
              Text(
                "\nWelcome ${FirebaseAuth.instance.currentUser!.displayName}!!",
                style: TextStyle(
                  fontFamily: "Unbounded",
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                future: getDocID(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.circle_sharp),
                          title: GetUserName(documentId: docIDs[index]),
                          tileColor: Colors.deepPurple[200],
                          trailing: InkWell(
                              onTap: () async {
                                print("deleted");
                                await deletestudent(
                                    snapshot.data.docIDs[index].id);
                              },
                              child: Icon(Icons.delete)),
                        ),
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  SelectedItem(BuildContext context, int item) {
    switch (item) {
      case 0:
        print("Profile pic clicked");
        break;
      case 1:
        print("Username clicked");
        break;
      case 2:
        print("E-mail clicked");
        break;
      case 3:
        print("Logout Button clicked");
        break;
    }
  }

  deletestudent(id) {
    FirebaseFirestore.instance.collection("student").doc(id).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Complaint deleted")));
  }
}
