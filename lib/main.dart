import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/Pages.dart';
import 'package:flutter_project/Pages/ProfilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/WelcomePage",
      routes: {
        "/WelcomePage": (context) => WelcomePage(),
        "/ExamplePage": (context) => ExamplePage(),
        "/HomePage": (context) => HomePage(),
        "/BottomBar": (context) => BottomBar(),
        "/BooksPage": (context) => BooksPage(),
        "/MyBooks": (context) => MyBooks(),
        "/ProfilePage": (context) => ProfilePage(),
      }
    );
  }
}
