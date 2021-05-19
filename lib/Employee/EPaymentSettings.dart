import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: EPaymentSettings(),
  ));
}

class EPaymentSettings extends StatelessWidget {
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
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 120, 40, 10),
                margin: EdgeInsets.symmetric(vertical: 0.1, horizontal: 25.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'For Easypaisa or Jazzcash',
//                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    new Text(
                      'Enter CNIC or Phone Number',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 60.0),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    new Text(
                      'For Bank Account, Enter ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    new Text(
                      'Account Number',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 50.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              SizedBox(
                  width: 130.0,
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25),
                    ),
                    onPressed: () {},
                    child: Text("Save",
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
