import 'package:careaware/Models/ClientModel.dart';
import 'package:flutter/material.dart';
import 'package:careaware/Registration/regi_page2.dart';
import 'package:careaware/Registration/services.dart';

import 'Terms.dart';
import 'login.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  //form key here
  final _formKey = GlobalKey<FormState>();

  // variable to enable auto validating of the form
  bool _autoValidate = true;

  // variable to enable toggling between showing and hiding password
  bool _hidePassword = true;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  context, MaterialPageRoute(builder: (_) => Terms()));
            },
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => regi_page2()));
                  },
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 26.0,
                  ),
                )),
          ],
        ),
//        backgroundColor: Color(0xff9CD7DB),
        body: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Color(0xFF49B4BE),
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Text("Already Registered?",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                Text(" Sign in",
                                    style: TextStyle(
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Login()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF49B4BE),
                          ),
                          labelText: 'Full Name',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          return value.isEmpty ? 'Name cannot be empty' : null;
                        },
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFF49B4BE),
                            ),
                            labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      TextFormField(
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF49B4BE),
                          ),
                          labelText: 'Phone Number',
                        ),
                        keyboardType: TextInputType.phone,
                        validator: validateMobile,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Color(0xFF49B4BE),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Color(0xFF49B4BE),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _hidePassword,
                        validator: (String value) {
                          return value.length < 8
                              ? 'Password must be more than 8 characters'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      TextFormField(
                        controller: address,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.home,
                            color: Color(0xFF49B4BE),
                          ),
                          labelText: 'Address',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          return value.isEmpty
                              ? 'Address cannot be empty'
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: 150,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                          color: Color(0xff007BA4),
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 20),
                          ),
//                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
//                              Scaffold.of(context).showSnackBar(SnackBar(
//                                content: Text('Form Validated, No errors'),
//                              ));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => regi_page2(
                                              clientModel: ClientModel(
                                            email: email.text,
                                            fullName: name.text,
                                            address: address.text,
                                            phoneNumber: phoneNumber.text,
                                            password: password.text,
                                          ))));
                            }
                          },
                          textColor: Colors.white,
                          elevation: 2.0,
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// regex method to validate user phone number
String validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

// regex method to validate email
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
