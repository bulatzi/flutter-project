import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/DetailedFeaturedBookCheckoutPage.dart';
import 'package:flutter_project/theme.dart' as Theme;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('FeaturedBooks').orderBy('title').snapshots();
    return MaterialApp(
      title: 'HomePage',
      color: Theme.CompanyColors.green[200],
      theme: Theme.CompanyThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: _booksStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Loading"));
                }
                return new ListView.builder(
                    itemCount: snapshot.data!.docs.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if(index == 0)
                        {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Image.asset(
                                'assets/images/libLogo.jpg',
                                height: 285,
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                "Featured Books",
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,),
                                ),
                              ),
                            ],
                          );
                        }
                      else{
                        return buildCheckoutList(context, snapshot.data!.docs[index - 1]);
                      }
                    }
                );
              }
          ),
        ),
      ),
    );
  }

  Widget buildCheckoutList(BuildContext context, DocumentSnapshot book) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0
        ),
        child: Card(
          child: InkWell(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.network(book['picture'],
                      width: 100,
                      height: 150,
                      fit: BoxFit.contain,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Placeholder(fallbackWidth: 100, fallbackHeight: 150,);
                      },
                    ),
                  ],
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                              children: <Widget>[
                                Flexible(fit: FlexFit.loose, child: Text(book['title'], style: TextStyle(fontSize: 20.0),)),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                              children: <Widget>[
                                Flexible(fit: FlexFit.loose, child: Text(book['author'])),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewFeaturedBookDetailsCheckout(book: book)));
            },
          ),
        ),
      ),
    );
  }
}
