import 'package:flutter/material.dart';

class MyDetails extends StatefulWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
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
              padding: EdgeInsets.only(left: 35, top: 100,right:35),
              child: Text('Hello\nUser!!\n\nHave a complaint ?\nRegister it!', style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontFamily: 'Zen Dots',
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text('bahubali'),
                  accountEmail: Text('xyz@vjti.ac.in'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child:Text('bahu'),
                  ),
              ),
              ListTile(
                title: Text('Register new complaint'),
                trailing: Icon(Icons.add_circle_outline),
              ),
              ListTile(
                title: Text('Complaint Status'),
                trailing: Icon(Icons.access_alarms_sharp),
              ),
              ListTile(
                title: Text('Close'),
                trailing: Icon(Icons.adb_outlined),
                onTap: ()=>Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
