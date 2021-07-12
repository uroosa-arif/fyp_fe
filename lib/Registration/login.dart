import 'package:careaware/Client/CMain.dart';
import 'package:careaware/Employee/EMain.dart';
import 'package:careaware/Models/ClientModel.dart';
import 'package:careaware/Registration/ForgetPassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:careaware/Registration/FirstScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Terms.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  String _username, _email, _password = "";
  final _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontSize: 15.0);
  bool _autoValidate = true;
  bool _hidePassword = true;
  bool asTabs = false;

  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  loginToFirebase() async {
    print(_email);
    print(_password);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);

      showToast("Login Success");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where('email', isEqualTo: _email)
          .get();
      print(querySnapshot.docs.length);
      print(querySnapshot.docs[0].data().toString());

      ClientModel clientModel =
          ClientModel.fromJson(querySnapshot.docs[0].data());

      if (clientModel.role == 'Employee') {
        if (_radioValue == 0) {
          print("employeee data hi hai");
          print(clientModel.isAccepted);
          if (clientModel.isAccepted == false) {
            showToast("Please visit us to approve your account");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => EMain()));
            return;
          }
        } else {
          showToast("No such client data found");
        }
      }

      if (clientModel.role == 'Client') {
        if (_radioValue == 1) {
          if (clientModel.isAccepted == false) {
            showToast("Please visit us to approve your account");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => CMain()));
            return;
          }
        } else {
          showToast("No such employee data found");
        }
      }
    } catch (error) {
      var errorMessage =
          'The password is invalid or the user does not have a password.';
      print(error);
      if (error
          .toString()
          .contains('no user record corresponding to this identifier')) {
        errorMessage = 'No such user found';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }

      showToast(errorMessage);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
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
      keyboardType: TextInputType.emailAddress,
      onChanged: (email) => _email = email,
    );

    SizedBox(
      height: 10.0,
    );

    final passwordField = TextFormField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _hidePassword,
      validator: (String value) {
        return value.length < 8 ? 'Incorrect Password' : null;
      },
      onChanged: (password) => _password = password,
    );

    SizedBox(
      height: 5.0,
    );

    final loginButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff007BA4),
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(height: 45.0, width: 160.0),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontSize: 18,
                letterSpacing: 1.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        onPressed: () async {
          await loginToFirebase();
        },
      ),
    );

    final RegisterButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff007BA4),
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(height: 20.0, width: 165.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
          Navigator.push(context, MaterialPageRoute(builder: (_) => Terms()));
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontSize: 18,
                letterSpacing: 1.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final ForgotPasswordButton = Material(
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ForgotPassword()));
        },
        child: Text(" Forgot Password? ",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontSize: 15,
                color: Color(0xff007BA4),
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0), // here the desired height
          child: AppBar(
            leading: IconButton(
                icon: Icon(Icons.keyboard_arrow_left, color: Color(0xff007BA4)),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FirstScreen()))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      body: SingleChildScrollView(
        child: Column(
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
                      backgroundImage: AssetImage('assets/images/Profile.jpg'),
                    ),
                    SizedBox(height: 20.0),
                    emailField,
                    SizedBox(height: 10.0),
                    passwordField,
                    SizedBox(
                      height: 1.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Login As',
                          style: TextStyle(
                              color: Color(0xFF007BA4),
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => CMain()));
                            },
                            child: new Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          new Text(
                            'Employee',
                            style: new TextStyle(fontSize: 15.0),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => EMain()));
                            },
                            child: new Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                          ),
                          new Text(
                            'Client',
                            style: new TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    loginButton,
                    SizedBox(
                      height: 10.0,
                    ),
                    RegisterButton,
                    SizedBox(
                      height: 5.0,
                    ),
                    ForgotPasswordButton,
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleNumber {
  int number;

  static final Map<int, String> map = {
    0: "zero",
    1: "one",
  };

  String get numberString {
    return (map.containsKey(number) ? map[number] : "unknown");
  }

  ExampleNumber(this.number);

  String toString() {
    return ("$number $numberString");
  }

  static List<ExampleNumber> get list {
    return (map.keys.map((num) {
      return (ExampleNumber(num));
    })).toList();
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}
