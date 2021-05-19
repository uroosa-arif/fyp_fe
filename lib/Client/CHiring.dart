import 'package:flutter/material.dart';
import 'CHiringArrow.dart';

void main() => runApp(CHiring());

/// This is the main application widget.
class CHiring extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<CHiring> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('images/avatar.png'),
                ),
                title: Text(
                  'Ali Ahmed',
                ),
                subtitle: Text('Hiring Date: 14-02-21'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CHiringArrow()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('images/avatar.png'),
                ),
                title: Text(
                  'Noman Ahmed',
                ),
                subtitle: Text('Hiring Date: 14-02-21'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CHiringArrow()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
