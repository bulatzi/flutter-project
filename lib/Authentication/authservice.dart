import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Authentication/error_handler.dart';
import 'package:flutter_project/Authentication/login_page.dart';
import 'package:provider/provider.dart';
import '../Pages/BottomBar.dart';
import 'package:flutter_project/theme.dart' as Theme;

import '../theme.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuth() {
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
    home: StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, snapshot) {
    if (snapshot.hasData) {
    return BottomBar();
    } else
    return LoginPage();
    }),
    );
    }
    );
  }

  getCurrentUser() async{
    return FirebaseAuth.instance.currentUser;
  }
  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign In
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      print('signed in');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  //Signup a new user
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  //Reset Password
  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}