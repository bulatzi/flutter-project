import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, "/ExamplePage");
              Navigator.pushNamed(context, "/BottomBar");
            },
            child: Text("Go to example page"),
          ),
        ),
      ),
    );
  }
}
