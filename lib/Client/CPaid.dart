import 'dart:io';
import 'package:careaware/Registration/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'CRate.dart';

void main() => runApp(CPaid());

class CPaid extends StatefulWidget {
  @override
  _pay createState() => _pay();
}

class _pay extends State<CPaid> {
  File _image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  final _formKey = GlobalKey<FormState>();
  // variable to enable auto validating of the form
  bool _autoValidate = true;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: Color(0xff007BA4),
        centerTitle: true,
        title: Text(
          'PAYMENT RECORD',
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
            SizedBox(
              height: 6,
            ),
            Container(
              child: Text(
                "Paid Through",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xff007BA4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'JazzCash',
                        style: new TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'EasyPaisa',
                        style: new TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      new Radio(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'BankAccount',
                        style: new TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 8.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.attach_money),
                labelText: 'Paid Amount',
              ),
              keyboardType: TextInputType.phone,
              validator: (String value) {
                return value.isEmpty ? 'Cannot be empty' : null;
              },
            ),
            Divider(
              thickness: 8.0,
            ),
            Container(
              child: Text(
                "Upload Receipt",
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
                decoration: BoxDecoration(
                  color: const Color(0xff9CD7DB).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 195,
                child: Center(
                  child: _image == null ? Text('') : Image.file(_image),
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            SizedBox(
              width: 150,
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
                color: Color(0xff007BA4),
                label: Text('OK'),
                icon: Icon(Icons.check_box),
                onPressed: () {
                  String userID = FirebaseAuth.instance.currentUser.uid;

                  try {
                    String id = Uuid().v4();

                    if (_image != null) {
                      _image = getUrlFromFile(id, "Receipt", _image) as File;
                    }
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(userID)
                        .update({
                      'Receipt': _image,
                    });
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CRate()));
                  } catch (e) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(userID)
                        .update({
                      'Receipt': _image,
                    });
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CRate()));
                  }
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

  Future<String> getUrlFromFile(String id, String where, File file) async {
    String newValue = '';
    try {
      print("ASD4");
      UploadTask storageUploadTask =
          fireStorage.child('userData/$id/$where').putFile(_image);
      await storageUploadTask.then((tasksnap) async {
        var mediaurl = await tasksnap.ref.getDownloadURL();
        print(mediaurl);
        setState(() {
          newValue = mediaurl;
        });
        print("ASD5");
      });
      return newValue;
    } catch (e) {
      print("Cant upload");
      return newValue;
    }
  }
}
