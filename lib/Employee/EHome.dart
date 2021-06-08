import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').where('role',isEqualTo: 'Client').snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            else if(snapshot.data.docs.isEmpty)
                {
                  return  Center(
                    child: Text('NO Client DAta found'),
                  );
                }

            else{
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context,i){
                    ClientModel clientModel=ClientModel.fromJson(snapshot.data.docs[i].data());

                    return
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(clientModel.profilePhotoUrl),
                          ),
                          title: Text(
                            "${clientModel.fullName}",
                          ),
                          subtitle: Text('Services: Caring, Bandaging, Cooking'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => EHomeArrow()));
                          },
                        ),
                      );
                  });
            }

          },
        ),
      ),
    );
  }
}



