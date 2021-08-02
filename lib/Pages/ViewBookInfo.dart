import 'package:flutter/material.dart';
import 'package:flutter_project/Database/Database.dart';
import 'package:flutter_project/data.dart' as data;


class ViewBook extends StatelessWidget {
  int index;
  ViewBook(this.index);
/*
  Future _getBook1Info(int index) async{
    BookInfo book =  await getBook("Ringworld").title;
  }
*/
  @override
  Widget build(BuildContext context)  {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset(data.getBook1().elementAt(index).image,
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.fill),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 8, top: 20),
              child: Text(
                'Book Title: ${data.getBook1().elementAt(index).title}',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 8, top: 10),
              child: Text(
                'Author: ${data.getBook1().elementAt(index).author}',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 8, top: 10),
              child: Text(
                'Year Published: ${data.getBook1().elementAt(index).year}',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 8, top: 10, bottom: 15),
              child: Text('Summary: '),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text('${data.getBook1().elementAt(index).summary}'),
            )
          ],
        ),
      ),
    );

  }


}
