import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: MyProfile(),
  ));
}

class MyProfile extends StatelessWidget {
  // This widget is the root of your application.
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
            child: Image.asset(
              'images/avatar.png',
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
                'Uroosa Arif',
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
                '+923219876543',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CNIC: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                '37405-1809874-0',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                'uroosa@gmail.com',
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
                'Female',
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
                'abc block wah cantt',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
