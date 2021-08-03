import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/Pages.dart';
import 'package:flutter_project/Pages/ProfilePage.dart';
import 'package:flutter_project/theme.dart' as Theme;
import 'Pages/authservice.dart';

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
        debugShowCheckedModeBanner: true,
        title: 'User Profile',
        color: Theme.CompanyColors.green[200],
        theme: Theme.CompanyThemeData,
        home: AuthService().handleAuth(),
        routes: {
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
