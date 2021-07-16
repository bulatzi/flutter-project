import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Database/authentication.dart';
import 'package:flutter_project/Pages/Pages.dart';
import 'package:flutter_project/Database/Database.dart';
import 'package:flutter_project/theme.dart' as Theme;

// TODO - Fix the color scheme on the login page

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: AuthDialog(),
          ),
        ),
      );
  }
}

class AuthDialog extends StatefulWidget {
  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  bool _isUser = true;

  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  String? _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String? _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            color: Theme.CompanyColors.green[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Your local library',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ////////////////////////////////////////////////////////////////////////////////////////TODO - DELETE THIS
                // It was added temporarily to allow developers to skip over the login screen without having to type in login info every time.
                Center(
                  child: ElevatedButton(
                    child: Text("Bypass Login"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/BottomBar");
                      },
                  ),
                ),
                ////////////////////////////////////////////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Email address',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    focusNode: textFocusNodeEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: textControllerEmail,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingEmail = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodeEmail.unfocus();
                      FocusScope.of(context)
                          .requestFocus(textFocusNodePassword);
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800]!,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: "Email",
                      fillColor: Colors.white,
                      errorText: _isEditingEmail
                          ? _validateEmail(textControllerEmail.text)
                          : null,
                      errorStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 8,
                  ),
                  child: Text(
                    'Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    focusNode: textFocusNodePassword,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: textControllerPassword,
                    obscureText: true,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingPassword = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodePassword.unfocus();
                      FocusScope.of(context)
                          .requestFocus(textFocusNodePassword);
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800]!,
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: "Password",
                      fillColor: Colors.white,
                      errorText: _isEditingPassword
                          ? _validatePassword(textControllerPassword.text)
                          : null,
                      errorStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blueGrey.shade800,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isLoggingIn = true;
                                textFocusNodeEmail.unfocus();
                                textFocusNodePassword.unfocus();
                              });
                              if (_validateEmail(textControllerEmail.text) ==
                                  null &&
                                  _validatePassword(
                                      textControllerPassword.text) ==
                                      null) {
                                await signInWithEmailPassword(
                                    textControllerEmail.text,
                                    textControllerPassword.text)
                                    .then((result) {
                                  if (result != null) {
                                    print(result);
                                    setState(() {
                                      loginStatus =
                                      'You have successfully logged in';
                                      loginStringColor = Colors.green;
                                    });
                                    Future.delayed(Duration(milliseconds: 500),
                                            () {
                                              Navigator.pushNamed(context, "/BottomBar");
                                        });
                                  }
                                }).catchError((error) {
                                  print('Login Error: $error');
                                  setState(() {
                                    loginStatus =
                                    'Error occurred while logging in';
                                    loginStringColor = Colors.red;
                                  });
                                });
                              } else {
                                setState(() {
                                  loginStatus = 'Please enter email & password';
                                  loginStringColor = Colors.red;
                                });
                              }
                              setState(() {
                                _isLoggingIn = false;
                                textControllerEmail.text = '';
                                textControllerPassword.text = '';
                                _isEditingEmail = false;
                                _isEditingPassword = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: _isLoggingIn
                                  ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                  new AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                                  : Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blueGrey.shade800,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isRegistering = true;
                              });
                              await registerWithEmailPassword(
                                  textControllerEmail.text,
                                  textControllerPassword.text)
                                  .then((result) {
                                if (result != null) {
                                  setState(() {
                                    loginStatus =
                                    'You have registered successfully';
                                    loginStringColor = Colors.green;
                                  });
                                  print(result);
                                }
                              }).catchError((error) {
                                print('Registration Error: $error');
                                setState(() {
                                  loginStatus =
                                  'Error occurred while registering';
                                  loginStringColor = Colors.red;
                                });
                              });

                              setState(() {
                                _isRegistering = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: _isRegistering
                                  ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                  new AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                                  : Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                loginStatus != null
                    ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Text(
                      loginStatus!,
                      style: TextStyle(
                        color: loginStringColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
