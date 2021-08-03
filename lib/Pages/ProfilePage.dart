import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/authservice.dart';
import 'package:flutter_project/theme.dart' as Theme;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(primary: Colors.green, textStyle: const TextStyle(fontSize: 20));
    Widget userProfile = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image(  //default user image
          image: NetworkImage(
              'https://i.dlpng.com/static/png/5066062-user-profile-icon-png-download-fa-user-circle-o-free-profile-icon-png-820_861_preview.png'),
            height: 200,
            width: 200,
          ),

          SizedBox(height: 10), //space between picture and user name

          Text(
            //grab users name from firebase?
            'admin@test.com',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(height: 30),

          ElevatedButton( //log out button
            style: style,
            onPressed: () {
              AuthService().signOut();
            },
            child: const Text('Log Out'),

          ),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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