import 'package:careaware/General/chat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:careaware/Volunteer/Volunteer.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    home: FirstScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    initalize();
    super.initState();
  }

  initalize() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/images/Home_Screen_Icon.png',
                height: 250,
              ),
            ),
            new Container(
              child: Text(
                "Care Aware",
                style: TextStyle(
                  fontFamily: 'Britannic',
                  fontSize: 45,
                  color: Color(0xFF102E50),
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Always Caring. Always Here.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 40),
              height: 80,
              width: 200,
              child: new RaisedButton(
                color: Color(0xff007BA4),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
                child: new Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "OR",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 10),
              height: 50,
              width: 200,
              child: new RaisedButton(
                color: Color(0xff007BA4),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
                child: new Text(
                  'Enter as Volunteer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Volunteer()));
                },
              ),
            ),
          ])),
    );
  }
}
