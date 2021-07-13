import 'package:careaware/Client/CHomeArrow.dart';
import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'CHiringArrow.dart';

void main() => runApp(CHiring());

/// This is the main application widget.
class CHiring extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<CHiring> {
  String currentUser;

  @override
  void initState() {
    currentUser = FirebaseAuth.instance.currentUser.email;
    print(currentUser);
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
                      subtitle: Text('${recentClientModel.services}'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CHiringArrow(
                              name: recentClientModel.name,
                              photoURL: recentClientModel.profilImage,
                              services: recentClientModel.services,
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
        // body: ListView(
        //   children: <Widget>[
        //     Card(
        //       child: ListTile(
        //         leading: CircleAvatar(
        //           child: Image.asset('images/avatar.png'),
        //         ),
        //         title: Text(
        //           'Ali Ahmed',
        //         ),
        //         subtitle: Text('Hiring Date: 14-02-21'),
        //         trailing: Icon(Icons.keyboard_arrow_right),
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (_) => CHiringArrow()));
        //         },
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         leading: CircleAvatar(
        //           child: Image.asset('images/avatar.png'),
        //         ),
        //         title: Text(
        //           'Noman Ahmed',
        //         ),
        //         subtitle: Text('Hiring Date: 14-02-21'),
        //         trailing: Icon(Icons.keyboard_arrow_right),
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (_) => CHiringArrow()));
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
