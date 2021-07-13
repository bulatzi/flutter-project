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
        child:
          Column(
            children: [
              Image.asset(data.getBook().elementAt(index).image, width: MediaQuery.of(context).size.width, height: 250,fit: BoxFit.fill),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(data.getBook().elementAt(index).title)
                      ],
                    ),
                    new Row(
                      children: [
                        Text(data.getBook().elementAt(index).rating.toString())
                      ],
                    ),

                  ],
                ),
              )
            ],

          ),

      ),

    );
    throw UnimplementedError();
  }
}
