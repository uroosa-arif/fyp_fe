import 'package:flutter/material.dart';
import 'CPaymentArrow.dart';

void main() => runApp(CPaymentRecords());

/// This is the main application widget.
class CPaymentRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 12),
              child: Text('Total Paid Amount: Rs 4000/-',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 1.5)),
            )),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('images/avatar.png'),
                ),
                title: Text(
                  'Ali Ahmed',
                ),
                subtitle: Text('Paid Amount: Rs 2000/-'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CPaymentArrow()));
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
                subtitle: Text('Paid Amount: Rs 2000/-'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CPaymentArrow()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
