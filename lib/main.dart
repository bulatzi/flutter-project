import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/Pages.dart';
import 'package:flutter_project/Pages/ProfilePage.dart';
import 'package:flutter_project/theme.dart' as Theme;
import 'package:flutter_project/theme.dart';
import 'package:provider/provider.dart';
import 'Authentication/authservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Wasted Potential Library',
            themeMode: themeProvider.themeMode,
            theme: Theme.MyThemes.lightTheme,
            darkTheme: Theme.MyThemes.darkTheme,
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
      },
    );
  }
}
