import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart' as Theme;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget userProfile = Container(
      padding:  const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          //grab users name from firebase?
        'Isa\'s Profile',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          ),
        ),
      ],
      ),
    );

    return MaterialApp(
      title: 'User Profile',
      color: Theme.CompanyColors.green[200],
      theme: Theme.CompanyThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: ListView(
          children: [
            userProfile,
          ],
        ),
      ),
    );
  }
}