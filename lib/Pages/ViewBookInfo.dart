import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart' as data;

class ViewBook extends StatelessWidget {
  int index;
  ViewBook(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset(data.getBook().elementAt(index).image,
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.fill),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 8, top: 20),
              child: Text(
                'Book Title: ${data.getBook().elementAt(index).title}',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 8, top: 10),
              child: Text(
                'Author: ${data.getBook().elementAt(index).author}',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 8, top: 10),
              child: Text(
                'Year Published: ${data.getBook().elementAt(index).year}',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 8, top: 15, bottom: 15),
              child: Text('Summary: '),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text('${data.getBook().elementAt(index).summary}'),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
