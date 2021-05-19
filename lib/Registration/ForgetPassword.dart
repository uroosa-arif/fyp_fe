import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:careaware/Registration/FirstScreen.dart';
import 'package:careaware/Registration/login.dart';
import 'Terms.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontSize: 15.0);
  bool _autoValidate = true;

  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter your Email",
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xFF49B4BE),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
      validator: (email) {
        if (email.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email)) {
          return 'Enter a valid email!';
        }
        return null;
      },
    );

    SizedBox(
      height: 10.0,
    );

    final SubmitButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff007BA4),
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(height: 45.0, width: 160.0),
        child: Text("Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontSize: 18,
                letterSpacing: 1.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          if (_formKey.currentState.validate()) {
//            _formKey.currentState.save();
          }
          Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
        },
      ),
    );

    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
//          onPressed: () => Navigator.of(context).pop(),
//        ),
//        centerTitle: true,
//        backgroundColor: Colors.transparent,
//        elevation: 0,
//
//      ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0), // here the desired height
        child: AppBar(
          backgroundColor: Color(0xff007BA4),
          centerTitle: true,
          title: Text('Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              )),
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40.0),
                  CircleAvatar(
                    radius: 48.0,
                    backgroundImage: AssetImage('images/forgot.png'),
                  ),
                  SizedBox(height: 25.0),
                  emailField,
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'An email will be sent allowing you',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'to reset your password',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  SubmitButton,
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
