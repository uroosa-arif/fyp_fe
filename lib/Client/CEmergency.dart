import 'package:flutter/material.dart';

class CEmergency extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<CEmergency> {
  //form key here
  final _formKey = GlobalKey<FormState>();
  // variable to enable auto validating of the form
  bool _autoValidate = true;
  // variable to enable toggling between showing and hiding password
  bool _hidePassword = true;

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Please Enter Phone Numbers To Be Dialed In Emergency Situations.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 6,
                            ),
                            child: Text(
                              "Emergency Contacts",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff007BA4)),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.only(left: 80.0),
                            icon: const Icon(Icons.edit),
                            tooltip: 'Edit',
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    'Edited!',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff007BA4)),
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            padding: const EdgeInsets.only(left: 2.0),
                            icon: const Icon(Icons.save),
                            tooltip: 'Save',
                            onPressed: () {
//                              if (_formKey.currentState.validate()) {
//                                Navigator.push(context, MaterialPageRoute(builder: (_)=> Services()));
//                              }
//                              else
                              return showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text(
                                          "Your saved emergency contacts are:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff007BA4)),
                                        ),
                                        content: Text(myController.text),
                                      ));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: myController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone Number',
                        ),
                        keyboardType: TextInputType.phone,
                        validator: validateMobile,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: myController2,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone Number (Optional)',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: myController3,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone Number (Optional)',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: RaisedButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40),
                          ),
                          color: Color(0xff007BA4),
                          label: Text(
                            'EMERGENCY DIAL',
                            style: TextStyle(fontSize: 20),
                          ),
                          icon: Icon(Icons.phone_in_talk),
                          onPressed: () {},
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
