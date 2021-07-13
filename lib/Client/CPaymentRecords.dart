import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'CPaymentArrow.dart';

void main() => runApp(CPaymentRecords());

/// This is the main application widget.
class CPaymentRecords extends StatelessWidget {
  String currentUser = FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: currentUser)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.docs.isEmpty) {
              return Center(child: Text('No Data Found'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  print(snapshot.data.toString());
                  RecentClientModel recentClientModel =
                      RecentClientModel.fromJson(snapshot.data.docs[i].data());
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(recentClientModel.profilImage),
                      ),
                      title: Text(
                        "${recentClientModel.name}",
                      ),
                      subtitle: Text('Total Amount paid Rs. 1000'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CPaymentArrow(),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
