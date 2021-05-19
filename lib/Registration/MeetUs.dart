import 'dart:developer';

import 'package:careaware/Registration/services.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
//    home: MyApp(),
  ));
}

class MeetUs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEET US'),
        backgroundColor: Color(0xFF007BA4),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'The data you entered in your registration needs to be aunthenticated in person because Care Aware has very strict policy about fraud and providing false information/data. If you want to open your account you need to come and authenticate yourself by meeting us. We’ll have a short meetup and will authenticate the information you just provided us. We’ll wait for you for 30 days if you don’t come we’ll have to delete your information.',
            textAlign: TextAlign.justify,
            style: TextStyle(height: 1.5 //You can set your custom height here
                ),
          ),
        ),
        Icon(Icons.location_pin),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'Class Room 4, Software Engineering Department, University of Engineering & Technology, Taxila.',
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.5 //You can set your custom height here
                ),
          ),
        ),
        Icon(Icons.access_time),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'Monday to Friday\n9:00AM to 3:00PM',
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.5 //You can set your custom height here
                ),
          ),
        ),
        SizedBox(
          width: 150,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25),
            ),
            color: Color(0xff007BA4),
            child: Text(
              'OK',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
            textColor: Colors.white,
            elevation: 2.0,
            padding: EdgeInsets.all(10.0),
          ),
        ),
      ]),
    );
  }
}
