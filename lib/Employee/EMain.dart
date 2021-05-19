import 'package:careaware/Employee/EPaymentSettings.dart';
import 'package:careaware/General/PrivacyPolicy.dart';
import 'package:flutter/material.dart';
import 'package:careaware/General/MyProfile.dart';
import '../General/Contactus.dart';
import '../General/DummyTerms.dart';
import 'EMyClients.dart';
import 'EPaymentRecords.dart';
import 'EHome.dart';
import '../Registration/FirstScreen.dart';

void main() => runApp(EMain());

class EMain extends StatefulWidget {
  EMain({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<EMain> {
  int selectedIndex = 0;
  final widgetOptions = [
    EHome(),
    EMyClients(),
    EPaymentRecords(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CARE AWARE'),
          backgroundColor: Color(0xFF007BA4),
          centerTitle: true,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: Text("My Profile"),
                trailing: Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyProfile()));
                },
              ),
              new ListTile(
                title: Text("Edit Services"),
                trailing: Icon(Icons.settings),
/*                 onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CSettings()));
                }, */
              ),
              new ListTile(
                title: Text("My Payment Details"),
                trailing: Icon(Icons.money),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => EPaymentSettings()));
                },
              ),
              new ListTile(
                title: Text("Privacy Policy"),
                trailing: Icon(Icons.privacy_tip),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PrivacyPolicy()));
                },
              ),
              new ListTile(
                title: Text("Terms and Conditions"),
                trailing: Icon(Icons.my_library_books),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DTerms()));
                },
              ),
              new ListTile(
                title: Text("Contact Us"),
                trailing: Icon(Icons.call),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Con()));
                },
              ),
              new ListTile(
                title: Text("Log Out"),
                trailing: Icon(Icons.logout),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FirstScreen()));
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text(
                'My Clients',
                style: TextStyle(fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              title: Text(
                'Payments',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
          currentIndex: selectedIndex,
          backgroundColor: Color(0xFF007BA4),
          selectedItemColor: Colors.white,
          onTap: onItemTapped,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
