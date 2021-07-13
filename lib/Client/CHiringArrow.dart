import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'CPaymentDetailsofE.dart';

void main() {
  runApp(CHiringArrow());
}

class CHiringArrow extends StatelessWidget {
  final String name, photoURL;
  List services;
  CHiringArrow({this.name, this.photoURL, this.services});
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'EMPLOYEE DETAILS',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          backgroundColor: Color((0xFF007BA4)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('$photoURL'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Color(0xFF007BA4),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                SmoothStarRating(
                  rating: rating,
                  isReadOnly: true,
                  size: 30,
                  filledIconData: Icons.star,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  color: Colors.amber,
                  borderColor: Colors.amber,
                  allowHalfRating: false,
                  spacing: 2.0,
                  onRated: (value) {
//                  print("rating value -> $value");
                    // print("rating value dd -> ${value.truncate()}");
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 3, 40, 10),
                  margin: EdgeInsets.symmetric(vertical: 0.1, horizontal: 25.0),
                  child: Column(children: <Widget>[
                    Text(
                      'Time Slot',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '(Full TIme)',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                        color: Color(0xFF007BA4),
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    new Text(
                      'Services',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    new Text(
                      '$services',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                        color: Color(0xFF007BA4),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    new Text(
                      'Availability days',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    new Text(
                      '(Monday to Friday)',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                        color: Color(0xFF007BA4),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    new Text(
                      'Availability time',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    new Text(
                      '(12 PM to 5 PM)',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                        color: Color(0xFF007BA4),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 110.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0.1, horizontal: 45.0),
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
//                          width: 120,
//                          height: 50,
                            child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                          ),
                          onPressed: () {},
                          child: Text("Message"),
                          color: Color(0xFF007BA4),
                          textColor: Colors.white,
                        )),
                        SizedBox(
                          width: 35.0,
                        ),
                        Expanded(
//                          width: 120,
//                          height: 50,
                            child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CPaymentDetailsofE()));
                          },
                          child: Text("Pay"),
                          color: Color(0xFF007BA4),
                          textColor: Colors.white,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
