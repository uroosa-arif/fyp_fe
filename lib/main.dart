import 'package:careaware/Registration/MeetUs.dart';
import 'package:careaware/Registration/services.dart';
import 'package:flutter/material.dart';
import 'package:careaware/Registration/CNIC.dart';
import 'package:careaware/Client/CEmergency.dart';
import 'package:careaware/Client/CReport.dart';
import 'package:careaware/Client/CPaid.dart';
import 'package:careaware/Registration/regi_page.dart';
import 'package:careaware/Registration/FirstScreen.dart';
import 'Client/CMain.dart';
import 'Employee/EMain.dart';
import 'Registration/FirstScreen.dart';
import 'General/Contactus.dart';
import 'Registration/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
