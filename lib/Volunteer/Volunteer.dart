import 'package:careaware/Models/ClientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../Registration/FirstScreen.dart';
//import 'package:flutter_image_slideshow_test/flutter_image_slideshow.dart';

void main() {
  runApp(Volunteer());
}

class Volunteer extends StatefulWidget {
  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff007BA4),
          centerTitle: true,
          title: Text(
            'VOLUNTEER',
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FirstScreen()));
            },
          ),
        ),
        // body: StreamBuilder<QuerySnapshot>(
        //   stream:
        //       FirebaseFirestore.instance.collection('volunteers').snapshots(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //       return ListView.builder(
        //         itemCount: snapshot.data.docs.length,
        //         itemBuilder: (context, i) {
        //           print(snapshot.data.docs[i]);
        //           return Card(
        //             child: ListTile(
        //               leading: CircleAvatar(
        //                 backgroundImage:
        //                     NetworkImage(snapshot.data.docs[i].toString()),
        //               ),
        //               trailing: Icon(Icons.keyboard_arrow_right),
        //               onTap: () {
        //                 // print(clientModel.profilePhotoUrl);
        //                 // Navigator.push(
        //                 //   context,
        //                 //   MaterialPageRoute(
        //                 //     builder: (_) => CHomeArrow(
        //                 //       name: clientModel.fullName,
        //                 //       imageURL: clientModel.profilePhotoUrl,
        //                 //       services: clientModel.services,
        //                 //     ),
        //                 //   ),
        //                 // );
        //               },
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        body: ImageSlideshow(
          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: double.infinity,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Color(0xff007BA4),

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          /// The widgets to display in the [ImageSlideshow].
          /// Add the sample image file into the images folder

          children: [
            Image.asset(
              'assets/images/sample_image_1.png',
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/sample_image_2.jpg',
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/sample_image_3.jpg',
              fit: BoxFit.fitWidth,
            ),
          ],

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 5000,
        ),
      ),
    );
  }
}
