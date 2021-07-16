import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/Pages.dart';
import 'package:flutter_project/data.dart' as data;
import 'package:flutter_project/theme.dart' as Theme;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage> {
  //BookInfo getInfo = new BookInfo();
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
Widget featuredBooks = GridView.builder(
     padding: EdgeInsets.only(top: 20),
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
        ),
      //crossAxisSpacing:  5,
      //mainAxisSpacing: 5,
        scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: data.getBook().length,
      itemBuilder: (BuildContext context, int index){
         return ListTile(
           contentPadding: EdgeInsets.only(top: 15, right: 15),

           title: Image.asset(data.getBook().elementAt(index).image, fit: BoxFit.fill),
           onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ViewBook(index)),
           ),
         );

      }


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
            Container(
              margin: EdgeInsets.only(top: 25),
             child: Text(
                ' Featured Books',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),

            ),

            featuredBooks,
          ],
        ),
      ),
    );

  }
}
