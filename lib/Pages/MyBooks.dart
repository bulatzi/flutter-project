import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart' as Theme;

class MyBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget booksCheckedOut = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //retrieve featured books from database?
            'BOOKS CHECKED-OUT!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: TextDecoration.underline,
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
              Expanded(
                child: Text(
                'feat book description',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              ),
            ],  //children
          ),
          SizedBox(height: 10),
 /*
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
*/
        ],
      ),
    );


    return MaterialApp(
      title: 'Welcome',
      color: Theme.CompanyColors.green[200],
      theme: Theme.CompanyThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MY BOOKS',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: ListView(
          children: [
            //upload library logo to firebase?
            booksCheckedOut,
          ],
        ),
      ),
    );
  }
}
