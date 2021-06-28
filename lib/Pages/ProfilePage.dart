import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart' as Theme;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/HomePage");
            },
            child: Text("the is profile page Go back to home page"),
          ),
        ),
      ),
    );
  }
}