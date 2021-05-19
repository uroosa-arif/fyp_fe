import 'package:careaware/Employee/ERate.dart';
import 'package:flutter/material.dart';
import 'package:careaware/Registration/regi_page.dart';
import 'EMain.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EReport(),
    );
  }
}

class EReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff007BA4),
        centerTitle: true,
        title: Text(
          'REPORT',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ERate()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 130.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                      child: TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                          hintText: 'Why you want to report this user?',
                          hintStyle:
                              TextStyle(fontSize: 17.0, color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 150,
                      child: RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25),
                        ),
                        color: Color(0xff007BA4),
                        label: Text('Report'),
                        icon: Icon(Icons.report),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context),
                          );
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
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('REPORT USER'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("User has been successfully reported!"),
        Text(
          "We'll update you soon.",
        ),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (_) => EMain()));
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Close'),
      ),
    ],
  );
}
