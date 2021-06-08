import 'dart:io';
import 'package:careaware/Models/ClientModel.dart';
import 'package:careaware/Registration/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

import 'package:search_choices/search_choices.dart';

import 'CNIC.dart';

void main() => runApp(regi_page2());

class regi_page2 extends StatefulWidget {
  ClientModel clientModel;

  regi_page2({this.clientModel});

  @override
  _regi_page2 createState() => _regi_page2();
}

class _regi_page2 extends State<regi_page2> {
  final _formKey = GlobalKey<FormState>();

  File _image;
  final picker = ImagePicker();

  String role="Employee";
  String gender1='Male';

  bool asTabs = false;
  String selectedValue;

  List<int> selectedItems;
  final List<DropdownMenuItem> items = [];

  final String loremIpsum = "Employee  Client";

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

  void initState() {
    print(widget.clientModel.email);

    String wordPair = " ";
    loremIpsum.split(" ").forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + "";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      if (_radioValue == 0) {
        role = "Employee";
      } else {
        role = "Client";
      }

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
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
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Services()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(),
            Container(
              child: Text(
                "Select Gender",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xff007BA4),
                ),
              ),
            ),

            getWidget(true),
            Divider(
              thickness: 8.0,
            ),
            Container(
              child: Text(
                "Register As",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xff007BA4),
                ),
              ),
            ),
//            SearchChoices.single(
//              items: items,
//              value: selectedValue,
//              hint: "Register As",
//              searchHint: null,
//              onChanged: (value) {
//                setState(() {
//                  selectedValue = value;
//                });
//              },
//              dialogBox: false,
//              isExpanded: true,
//              menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
//            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  new Text(
                    'Employee',
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  new Text(
                    'Client',
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 8.0,
            ),
            Container(
              child: Text(
                "Select Profile Photo",
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
                child: _image == null ? Text('') : Image.file(_image,fit: BoxFit.fill,),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            SizedBox(
              width: 150,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
                color: Color(0xff007BA4),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CNIC(
                                clientModel: widget.clientModel,
                                profilePhoto: _image,
                                role: role,
                                gender: gender1,
                              )));
                },
                textColor: Colors.white,
                elevation: 2.0,
                padding: EdgeInsets.all(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getWidget(bool alignVertical) {
    return Container(
      margin: EdgeInsets.only(left: 50, top: 10, bottom: 10),
      child: GenderPickerWithImage(
        verticalAlignedText: alignVertical,
        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle:
            TextStyle(color: Color(0xff9CD7DB), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Color(0xff007BA4), fontWeight: FontWeight.bold),
        onChanged: (Gender gender) {
          print(gender.index);
          setState(() {
            gender1 = gender.index == 0 ? "Male" : "Female";
          });
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
