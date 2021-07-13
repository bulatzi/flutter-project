import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart' as Theme;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 8, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    //retrieve user's name
                    'HELLO, USER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget featuredBooks = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //retrieve featured books from database?
            ' Featured Books',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),   //adds empty vertical space between each featured book

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: InkWell(   //not working
                  splashColor: Colors.green[200],
                  onTap: () {   //working need to implement destination
                    print('go to featured book 1 page');
                  },
                  child:
                  Image.asset(
                    'assets/images/sampleBook1.jpg',
                    //width: 600,
                    height: 250,
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(width: 20),  //adds space between feat book image and description
              Text(
                'feat book description',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],  //children
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.green[200],
                  onTap: () {
                    print('go to featured book 2 page');
                  },
                  child:
                  Image.asset(
                    'assets/images/sampleBook2.jpg',
                    //width: 600,
                    height: 250,
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'feat book description',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],  //children
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.green[200],
                  onTap: () {
                    print('go to featured book 3 page');
                  },
                  child:
                  Image.asset(
                    'assets/images/sampleBook3.jpg',
                    //width: 600,
                    height: 250,
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'feat book description',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],  //children
          ),
        ],
      ),
    );


    return MaterialApp(
      title: 'Welcome',
      color: Theme.CompanyColors.green[200],
      theme: Theme.CompanyThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('WELCOME',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: ListView(
          children: [
            //upload library logo to firebase?
            titleSection,
            Image.asset(
              'assets/images/libLogo.jpg',
              height: 285,
              fit: BoxFit.contain,
            ),
            featuredBooks,
          ],
        ),
      ),
    );
  }
}
