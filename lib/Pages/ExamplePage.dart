import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/WelcomePage");
            },
            child: Text("Go back to main page"),
          ),
        ),
      ),
    );
  }
}
