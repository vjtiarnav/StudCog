/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/screens/signin_screen.dart';*/
//import 'dart:ffi';
//import 'dart:html';
//import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inheritance/configs/themes/app_colors.dart';
import 'package:inheritance/screens/signin_screen.dart';
import 'package:inheritance/services/firebase_services.dart';
//import 'package:inheritance/utils/colors_utils.dart';
//import 'package:flutter/src/rendering/box.dart';
//import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference student =
      FirebaseFirestore.instance.collection("student");
  String imageUrl = '';
  String RegId = '';
  String Detailed_complaint = '';
  String Area_of_Complaint = '';
  String College = '';
  var time = DateTime.now();
  /*List<String> docIDs = [];
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('student').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          },),
        );
  }

  void initState() {
    getDocID();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    // var time = DateTime.now();
    var email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Student Portal",
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Column(
            children: <Widget>[
              Text(
                "\n\nHello ${FirebaseAuth.instance.currentUser!.displayName}!!\nRegister a Complaint",
                style: TextStyle(
                  fontFamily: "Unbounded",
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "College : ",
                      style: TextStyle(
                        fontFamily: "Unbounded",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextField(
                        onChanged: (some) {
                          College = some;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "Registration ID : ",
                      style: TextStyle(
                        fontFamily: "Unbounded",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          RegId = value;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "Area of\nComplaint : ",
                      style: TextStyle(
                        fontFamily: "Unbounded",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextField(
                        onChanged: (thing) {
                          Area_of_Complaint = thing;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "Detailed\nComplaint : ",
                      style: TextStyle(
                        fontFamily: "Unbounded",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextField(
                        onChanged: (amount) {
                          Detailed_complaint = amount;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "Upload image\nof complaint : ",
                      style: TextStyle(
                        fontFamily: "Unbounded",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? file = await imagePicker.pickImage(
                              source: ImageSource.camera);
                          print('${file?.path}');
                          if (file == null) return;
                          String uniqueFileName =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          //Reference referenceDirImages = referenceRoot.child('images');
                          Reference referenceImageToUpload =
                              referenceRoot.child(uniqueFileName);
                          try {
                            await referenceImageToUpload.putString(file.path);

                            imageUrl =
                                await referenceImageToUpload.getDownloadURL();
                          } catch (error) {}
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      textStyle: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    /*if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please upload image")));
                      return;
                    }*/
                    if (College.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter College")));
                      return;
                    }
                    if (RegId.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter Registration ID")));
                      return;
                    }
                    if (Area_of_Complaint.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter Area of Complaint")));
                      return;
                    }
                    if (Detailed_complaint.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter complaint description")));
                      return;
                    }
                    await student.add({
                      'College': College,
                      'Email': email,
                      'Registration ID': RegId,
                      'Detailed Complaint': Detailed_complaint,
                      'Area of Complaint': Area_of_Complaint,
                      'Image': imageUrl,
                      'Time': time,
                    }).then((value) => ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                            content: Text(
                                "Complaint Registered\nSolution will be conveyed on registered email-id in 5 days\nif not, register complaint again"))));
                  },
                  child: Text("Register Complaint"))
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
}
