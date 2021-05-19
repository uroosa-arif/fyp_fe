import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Care Aware',
    debugShowCheckedModeBanner: false,
    home: PrivacyPolicy(),
  ));
}

class PrivacyPolicy extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRIVACY POLICY'),
        backgroundColor: Color(0xFF007BA4),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'At Care Aware, accessible from PlayStore, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Care Aware and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Care Aware. This policy is not applicable to any information collected offline or via channels other than this application.\n\nConsent:\nBy using our application, you hereby consent to our Privacy Policy and agree to its terms.\n\nInformation we collect:\nThe personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, address, email address, and telephone number.\n\nHow we use your information:\nWe use the information we collect in various ways, including to: Provide, operate, and maintain our application; Improve, personalize, and expand our application; Understand and analyze how you use our website; Develop new products, services, features, and functionality; Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the application, and for marketing and promotional purposes; Send you emails; Find and prevent fraud.\n\nData Protection Rights:\nWe would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following: The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service. The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete. The right to erasure – You have the right to request that we erase your personal data, under certain conditions. The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions. The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions. The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5 //You can set your custom height here
                  ),
            ),
          ]),
        ),
      ),
    );
  }
}
