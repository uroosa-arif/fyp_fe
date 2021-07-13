import 'package:careaware/Employee/EHomeArrow.dart';
import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'CHomeArrow.dart';

void main() => runApp(CHome());

/// This is the main application widget.
class CHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('role', isEqualTo: 'Employee')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.docs.isEmpty) {
              return Center(
                child: Text('No Client DAta found'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
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
                      subtitle: Text('${clientModel.services}'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        print(clientModel.profilePhotoUrl);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CHomeArrow(
                              name: clientModel.fullName,
                              imageURL: clientModel.profilePhotoUrl,
                              services: clientModel.services,
                              email: clientModel.email,
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
