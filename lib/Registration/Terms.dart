import 'package:flutter/material.dart';
import 'package:careaware/Registration/regi_page.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      title: 'Care Aware',
      debugShowCheckedModeBanner: false,
//      home: MyHomePage(),
    );
  }
}

class Terms extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Terms> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => RegPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('TERMS & CONDITIONS'),
        backgroundColor: Color(0xff007BA4),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Welcome to Care Aware! \n \nThese terms and conditions outline the rules and regulations for the use of Care Aware. By accessing this application we assume you accept these terms and conditions. Do not continue to use Care Aware if you do not agree to take all of the terms and conditions stated on this page. The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client/Employee/Volunteer", "You" and "Your" refers to you, the person log on this application and compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the yourselves and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client/Employee in the most appropriate manner for the express purpose of meeting the Client’s/Employee’s needs in respect of provision of the Company’s stated services. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same. \n \nCookies: \nWe employ the use of cookies. By accessing Care Aware, you agreed to use cookies in agreement with the Privacy Policy. Most interactive applications use cookies to let us retrieve the user’s details for each visit. Cookies are used by our application to enable the functionality of certain areas to make it easier for people visiting our application. Some of our affiliate/advertising partners may also use cookies. \n \nLicense: \nUnless otherwise stated, UET Taxila and/or its licensors own the intellectual property rights for all material on Care Aware. All intellectual property rights are reserved. You may access this from Care Aware for your own personal use subjected to restrictions set in these terms and conditions. You must not: Republish material from Care Aware, Sell, rent or sub-license material from Care Aware, Reproduce, duplicate or copy material from Care Aware, Redistribute content from Care Aware, This Agreement shall begin on the date hereof. Parts of this application offer an opportunity for users to post and exchange opinions and information in certain areas of the application. We do not filter, edit, publish or review Comments prior to their presence on the application. Comments do not reflect the views and opinions of us, its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, we shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this application. We reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions. You warrant and represent that: You are entitled to post the Comments on our application and have all necessary licenses and consents to do so; The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party; The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy; The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity; You hereby grant us a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media. \n \nYour Privacy: \nPlease read Privacy Policy.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5 //You can set your custom height here
                  ),
            ),
            Row(
              children: [
                Material(
                  child: Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value;
                      });
                    },
                  ),
                ),
                Text(
                  'I accept terms and conditions.',
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            RaisedButton(
              color: Color(0xff007BA4),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: agree ? _doSomething : null,
            ),
          ]),
        ),
      ),
    );
  }
}
