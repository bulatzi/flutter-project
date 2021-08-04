import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/DetailedBookPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('FeaturedBooks').orderBy('title').snapshots();
    return Scaffold(
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
                            Center(
                              child: Image.asset(
                                  'assets/images/newpng.png',
                                  height: 200,
                                fit: BoxFit.contain,
                                ),
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
            onTap: () async{
              final DocumentSnapshot result = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Checkouts").doc(book['title']).get();
              if(result.exists){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ViewBookDetails(book: result)));
              }
              else{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewBookDetails(book: book)));
              }
            },
          ),
        ),
      ),
    );
  }
}
