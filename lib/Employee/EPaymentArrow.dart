import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'EMain.dart';

void main() {
  runApp(Epayrecords_details());
}

class Epayrecords_details extends StatelessWidget {
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
            'PAYMENT RECORD',
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
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 120, 40, 10),
                margin: EdgeInsets.symmetric(vertical: 0.1, horizontal: 25.0),
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Hiring Date:  DD/MM/YYYY',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  new Row(children: <Widget>[
                    Text(
                      'Payment Date:  DD/MM/YYYY',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: [
                      new Text(
                        'Received Amount:  Rs 5000/-',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18.0,
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
                        'Received through:  Easypaisa',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: Row(
                      children: [
                        Container(
                          child: new Image.asset(
                            'images/ree.png',
                            width: 250.0,
                            height: 170.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 70.0,
              ),
              SizedBox(
                  width: 130.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => EMain()));
                    },
                    child: Text("OK",
                        style: TextStyle(
                          fontSize: 20.0,
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
