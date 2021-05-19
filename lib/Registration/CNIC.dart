import 'dart:io';
import 'package:careaware/Registration/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: payrecords_details(),
    );
  }
}

class CNIC extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CNIC> {
  File _image;
  File _image2;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage2() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image2 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007BA4),
        centerTitle: true,
        title: Text(
          'REGISTRATION',
          textAlign: TextAlign.center,
        ),
//        leading: IconButton(
//          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
//          onPressed: () {
//            Navigator.push(context, MaterialPageRoute(builder: (_)=> Services()));
//          },
//        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Services()));
                },
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(),
            Container(
              child: Text(
                "Upload CNIC Front Side",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xff007BA4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
                backgroundColor: Color(0xff007BA4),
                heroTag: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xff9CD7DB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 200,
                child: Center(
                  child: _image == null ? Text('') : Image.file(_image),
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              child: Text(
                "Upload CNIC Back Side",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xff007BA4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: FloatingActionButton(
                onPressed: getImage2,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
                backgroundColor: Color(0xff007BA4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xff9CD7DB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 200,
                child: Center(
                  child: _image2 == null ? Text('') : Image.file(_image2),
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget getWidget(bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        verticalAlignedText: alignVertical,
        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle:
            TextStyle(color: Color(0xff9CD7DB), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Color(0xff007BA4), fontWeight: FontWeight.bold),
        onChanged: (Gender gender) {
          print(gender);
        },
        //Alignment between icons
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,

        opacityOfGradient: 0.1,
        padding: const EdgeInsets.all(3),
        size: 60, //default : 40
      ),
    );
  }
}
