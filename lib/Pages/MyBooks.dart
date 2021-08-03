import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'DetailedBookPage.dart';

class MyBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('Users').doc(uid).collection('Checkouts').orderBy('title').snapshots();
    return Scaffold(
        appBar: AppBar(
          title: Text('My Books',
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
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildCheckoutList(context, snapshot.data!.docs[index])
                );
              }
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
                  MaterialPageRoute(builder: (context) => ViewBookDetails(book: book)));
            },
          ),
        ),
      ),
    );
  }
}
