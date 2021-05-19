import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'EReport.dart';

void main() {
  runApp(ERate());
}

class ERate extends StatelessWidget {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'RATE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          backgroundColor: Color((0xFF007BA4)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Text(
                'Ali Ahmed',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xFF007BA4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro',
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              SmoothStarRating(
                rating: rating,
                isReadOnly: false,
                size: 40,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
                child: TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Share your experience',
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                  width: 113,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(
                                  "Your Ratings have been submitted",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff007BA4)),
                                ),
                              ));
                    },
                    child: Text("Submit",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    color: Color(0xFF007BA4),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25),
                    ),
                  )),
              SizedBox(
                height: 58.0,
              ),
              SizedBox(
                  width: 300,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Message",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    color: Color(0xFF007BA4),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25),
                    ),
                  )),
              SizedBox(
                width: 60.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                  width: 300,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EReport()));
                    },
                    child: Text("Report",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    color: Color(0xFF007BA4),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
