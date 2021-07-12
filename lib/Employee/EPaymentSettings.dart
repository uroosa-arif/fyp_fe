import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: EPaymentSettings(),
  ));
}

class EPaymentSettings extends StatelessWidget {
  var rating = 3.0;
  ClientModel clientModel;

  final _easyController = TextEditingController();
  final _bankController = TextEditingController();
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
                      controller: _easyController,
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
                    onPressed: () {
                      String id = Uuid().v4();
                      // clientModel.id = id;
                      String userID = FirebaseAuth.instance.currentUser.uid;

                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(userID)
                          .update({"bank_account": _bankController.text});
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(userID)
                          .update({"easypaisa_account": _easyController.text});
                    },
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
