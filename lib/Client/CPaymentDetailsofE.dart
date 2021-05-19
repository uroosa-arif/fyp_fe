import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:careaware/Client/CPaid.dart';

void main() {
  runApp(CPaymentDetailsofE());
}

class CPaymentDetailsofE extends StatelessWidget {
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
            'PAYMENT DETAILS',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          backgroundColor: Color((0xFF007BA4)),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 120, 40, 10),
                margin: EdgeInsets.symmetric(vertical: 0.1, horizontal: 25.0),
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Easy Paisa',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  new Row(children: <Widget>[
                    Text(
                      'CNIC: 34567-7890234-4',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      new Text(
                        'Bank Account',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: [
                      new Text(
                        'Account Name: Askari Bank',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 120.0,
              ),
              SizedBox(
                  width: 130.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => CPaid()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40),
                    ),
                    child: Text("Paid",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    color: Color(0xFF007BA4),
                    textColor: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
