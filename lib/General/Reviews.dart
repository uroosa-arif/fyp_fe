import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: Reviews(),
  ));
}

class Reviews extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REVIEWS'),
        backgroundColor: Color(0xFF007BA4),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: SingleChildScrollView(
        child: Text('hgd'),
      ),
    );
  }
}
