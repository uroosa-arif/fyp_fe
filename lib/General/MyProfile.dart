import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: MyProfile(),
  ));
}

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ClientModel clientModel;

  String _userID = FirebaseAuth.instance.currentUser.uid;
  Map data;

  void getData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userID)
        .get()
        .then((value) {
      setState(() {
        data = value.data();
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          backgroundColor: Color(0xFF007BA4),
          centerTitle: true,
          leading: IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        body: Center(
          child: Column(children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 50),
              child: Image.network(
                '${data['profilePhotoUrl']}',
                height: 90,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '${data['fullName']}',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Phone number: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '${data['phoneNumber']}',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'CNIC: ',
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            //     ),
            //     Text(
            //       '${data[]}',
            //       style: TextStyle(fontSize: 17),
            //     ),
            //   ],
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '${data['email']}',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gender: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '${data['gender']}',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Address: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '${data['address']}',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ]),
        ));
  }
}
