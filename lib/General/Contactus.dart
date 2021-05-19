import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: Con(),
  ));
}

class Con extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Con> {
  List<String> attachment;
  bool useTempDirectory = true;
  @override
  void initState() {
    super.initState();
    attachment = new List<String>();
  }

  final _recipientController = TextEditingController(
    text: 'test@example.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(text: 'The Body');

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      body: _bodyController.text,
      attachmentPaths: attachment,
      isHTML: true,
    );

    String platformResponse;
    print(email.body);
    try {
      await FlutterEmailSender.send(email);

      platformResponse = 'success !';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final Widget imagePath = GridView.count(
      primary: false,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List<Widget>.generate(
        attachment.length,
        (int index) {
          final File file = File(attachment[index]);
          return GridTile(
            key: Key(attachment[index]),
            footer: GridTileBar(
              title: Text(
                file.path.split('/')?.last,
                textAlign: TextAlign.justify,
              ),
            ),
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Image.file(
                        File(attachment[index]),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.attachment,
                          size: 50,
                          color: Color(0xff007BA4),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    borderRadius: BorderRadius.circular(59),
                    type: MaterialType.transparency,
                    child: IconButton(
                      tooltip: 'remove',
                      onPressed: () {
                        setState(() {
                          attachment.removeAt(index);
                        });
                      },
                      padding: const EdgeInsets.all(10),
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        Icons.clear,
                        color: Color(0xff007BA4),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xff007BA4),
          centerTitle: true,
          title: Text(
            'CONTACT US',
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.of(context).pop(null),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: send,
              icon: Icon(Icons.send),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _recipientController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Recipient',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subject',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _bodyController,
                      maxLines: 10,
                      decoration: InputDecoration(
                          labelText: 'Body', border: OutlineInputBorder()),
                    ),
                  ),
                  imagePath,
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera),
          label: Text('Add Image'),
          backgroundColor: Color(0xff007BA4),
          onPressed: _openImagePicker,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 4.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Builder(
                builder: (BuildContext context) => FlatButton(
                  textColor: Color(0xff007BA4),
                  child: const Text('add text File'),
                  onPressed: () => _onCreateFile(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openImagePicker() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    final File pick = File(pickedFile.path);
    setState(() {
      attachment.add(pick.path);
    });
  }

  void _onCreateFile(BuildContext context) async {
    final TempFile tempFile = await _showDialog(context);
    final File newFile = await writeFile(tempFile.content, tempFile.name);
    setState(() {
      attachment.add(newFile.path);
    });
  }

  Future<TempFile> _showDialog(BuildContext context) {
    return showDialog<TempFile>(
      context: context,
      builder: (BuildContext context) {
        String content = '';
        String fileName = '';

        return SimpleDialog(
          title: const Text('write something to a file'),
          contentPadding: const EdgeInsets.all(8.0),
          children: <Widget>[
            TextField(
              onChanged: (String str) => fileName = str,
              autofocus: true,
              decoration: const InputDecoration(
                fillColor: Color(0xff007BA4),
                suffix: const Text('.txt'),
                labelText: 'file name',
                alignLabelWithHint: true,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                fillColor: Color(0xff007BA4),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                alignLabelWithHint: true,
                labelText: 'Content',
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (String str) => content = str,
              maxLines: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xff007BA4),
                  textColor: Theme.of(context).accentTextTheme.button.color,
                  child: const Icon(Icons.save),
                  onPressed: () {
                    final TempFile tempFile =
                        TempFile(content: content, name: fileName);
                    Navigator.of(context).pop<TempFile>(tempFile);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future<String> get _tempPath async {
    final Directory directory = await getTemporaryDirectory();

    return directory.path;
  }

  Future<String> get _localAppPath async {
    final Directory directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile(String fileName) async {
    final String path = await (useTempDirectory ? _tempPath : _localAppPath);
    return File('$path/$fileName.txt');
  }

  Future<File> writeFile(String text, [String fileName = '']) async {
    fileName = fileName.isNotEmpty ? fileName : 'fileName';
    final File file = await _localFile(fileName);

    return file.writeAsString('$text');
  }
}

class TempFile {
  TempFile({this.name, this.content});
  final String name, content;
}
