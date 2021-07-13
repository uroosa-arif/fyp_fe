import 'package:careaware/Client/CHomeArrow.dart';
import 'package:careaware/Employee/EHomeArrow.dart';
import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ERate.dart';

void main() => runApp(EMyClients());

/// This is the main application widget.
class EMyClients extends StatefulWidget {
  @override
  _EMyClientsState createState() => _EMyClientsState();
}

class _EMyClientsState extends State<EMyClients> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  getCurrentUser() async {
    final User user = _auth.currentUser;
    email = user.email;
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('EmployeeEmail', isEqualTo: '$email')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.docs.isEmpty) {
              return Center(child: Text('No Data Found'));
            } else {
              // print(currentUser);
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  print(snapshot.data.toString());
                  ClientModel clientModel =
                      ClientModel.fromJson(snapshot.data.docs[i].data());
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(clientModel.profilePhotoUrl),
                      ),
                      title: Text(
                        "${clientModel.fullName}",
                      ),
                      subtitle: Text('${clientModel.email}'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        print(clientModel.profilePhotoUrl);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EHomeArrow(
                              name: clientModel.fullName,
                              photoURL: clientModel.profilePhotoUrl,
                              services: clientModel.services,
                            ),
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
