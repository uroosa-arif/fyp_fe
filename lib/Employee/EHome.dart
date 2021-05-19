import 'package:flutter/material.dart';
import 'EHomeArrow.dart';

void main() => runApp(EHome());

/// This is the main application widget.
class EHome extends StatelessWidget {
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
                subtitle: Text('Services: Caring, Bandaging, Cooking'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => EHomeArrow()));
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
                subtitle: Text('Services: Caring, Bandaging, Cooking'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => EHomeArrow()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
