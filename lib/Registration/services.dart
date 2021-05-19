import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:careaware/Registration/regi_page.dart';
import 'package:careaware/Registration/regi_page2.dart';

import 'MeetUs.dart';

class Services extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Select Services',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: MyHomePage(),
    );
  }
}

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

class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
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
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => RegPage()));
          },
        ),
      ),
      body: Center(
        child: new Form(
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
                  dataSource: [
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
                  ],
                  textField: 'name',
                  valueField: 'code',
                  filterable: true,
                  required: true,
                  onSaved: (value) {
                    print('The value is $value');
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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MeetUs()));
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

//  void _onFormSaved() {
//    final FormState form = _formKey.currentState;
//    form.save();
//  }
}
