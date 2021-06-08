import 'dart:io';

import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:careaware/Registration/regi_page.dart';
import 'package:careaware/Registration/regi_page2.dart';
import 'package:uuid/uuid.dart';

import 'MeetUs.dart';

const MaterialColor kPrimaryColor = const MaterialColor(
  0xff007BA4,
  const <int, Color>{
    50: const Color(0xff007BA4),
    100: const Color(0xff007BA4),
    200: const Color(0xff007BA4),
    300: const Color(0xff007BA4),
    400: const Color(0xff007BA4),
    500: const Color(0xff007BA4),
    600: const Color(0xff007BA4),
    700: const Color(0xff007BA4),
    800: const Color(0xff007BA4),
    900: const Color(0xff007BA4),
  },
);

class Services extends StatefulWidget {
  ClientModel clientModel;
  String role;
  String gender;
  File profilePhoto;
  File cnicfront;
  File cnicback;

  Services(
      {this.clientModel,
      this.role,
      this.gender,
      this.profilePhoto,
      this.cnicfront,
      this.cnicback}); //  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ClientModel clientModel;

  @override
  void initState() {
    clientModel = ClientModel(
      email: widget.clientModel.email,
      fullName: widget.clientModel.fullName,
      password: widget.clientModel.password,
      phoneNumber: widget.clientModel.phoneNumber,
      address: widget.clientModel.address,
      role: widget.role,
      gender: widget.gender,
      services: [],
      isAccepted: false,
    );

    print(widget.cnicfront);
    print(widget.cnicback);
    print(widget.profilePhoto);

    super.initState();
  }

  List value1;

  List list = [
    {"name": "Supportive Home Care Aide"},
    {"name": "Cooking", "code": "1"},
    {"name": "Bathing", "code": "2"},
    {"name": "Cleaning", "code": "3"},
    {"name": "Driving", "code": "4"},
    {"name": "All Household chores", "code": "5"},
    {"name": "Medications", "code": "6"},
    {"name": "Baby sitting a healthy child", "code": "7"},
    {"name": "Personal care for disabled", "code": "8"},
    {"name": "Provision of necessities", "code": "9"},
    {"name": "All outdoor works", "code": "10"},
    {"name": "Baby sitting a special child", "code": "11"},
    {"name": "Mechanical works", "code": "12"},
    {"name": "Electrical Works", "code": "13"},
    {"name": "Care of old people", "code": "14"},
    {"name": "physiotherapy", "code": "15"},
    {"name": "Yoga/exercises", "code": "16"},
    {"name": "Giving Massage", "code": "17"},
    {"name": "Pick and drop", "code": "18"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007BA4),
        centerTitle: true,
        title: Text(
          'REGISTRATION',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : new Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MultiSelect(
                        autovalidate: true,
                        titleText: 'Select services you can provide',
                        validator: (dynamic value) {
                          if (value == null) {
                            return 'Please select one or more option(s)';
                          }
                          return null;
                        },
                        errorText: 'Please select one or more option(s)',
                        dataSource: list,
                        textField: 'name',
                        valueField: 'code',
                        filterable: true,
                        required: true,
                        onSaved: (value) {
                          print('The value is $value');
                          setState(() {
                            value1 = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 150,
                      child: RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        color: Color(0xff007BA4),
                        label: Text('REGISTER'),
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          _onFormSaved();

                          //   Navigator.push(
                          //       context, MaterialPageRoute(builder: (_) => MeetUs()));
                        },
                        textColor: Colors.white,
                        elevation: 2.0,
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool isLoading=false;

  void _onFormSaved() async {
    final FormState form = _formKey.currentState;
    form.save();
    for (int i = 0; i < value1.length; i++) {
      print(list[int.parse(value1[i])]['name']);
      clientModel.services.add(list[int.parse(value1[i])]['name']);
    }

    await uploadtoFirebase();

    print(clientModel.toJson().toString());
  }

  uploadtoFirebase() async {
    setState(() {
      isLoading = true;
    });
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: clientModel.email, password: clientModel.password);

      String id = Uuid().v4();

      clientModel.id = id;

      if (widget.profilePhoto != null) {
        clientModel.profilePhotoUrl =
            await getUrlFromFile(id, "profilePhote", widget.profilePhoto);
      }

      if (widget.cnicfront != null) {
        clientModel.cnicFront =
            await getUrlFromFile(id, "cnicFront", widget.cnicfront);
      }

      if (widget.cnicback != null) {
        clientModel.cnicBack =
            await getUrlFromFile(id, "cnicBack", widget.cnicback);
      }

      await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .set(clientModel.toJson());

      print("sab kuch hogya");

      setState(() {
        isLoading = false;
      });

      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();



    } catch (e) {
      print("Koi msla aggya hau:${e.toString()}");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String> getUrlFromFile(String id, String where, File file) async {
    String newValue = '';
    try {
      print("ASD4");
      UploadTask storageUploadTask =
          fireStorage.child('userData/$id/$where').putFile(widget.profilePhoto);
      await storageUploadTask.then((tasksnap) async {
        var mediaurl = await tasksnap.ref.getDownloadURL();
        print(mediaurl);
        setState(() {
          newValue = mediaurl;
        });
        print("ASD5");
      });
      return newValue;
    } catch (e) {
      print("Cant upload");
      return newValue;
    }
  }
}

final fireStorage = FirebaseStorage.instance.ref();
final firebaseAuth = FirebaseAuth.instance;
