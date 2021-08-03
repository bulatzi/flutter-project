import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class ViewFeaturedBookDetailsCheckin extends StatelessWidget{

  ViewFeaturedBookDetailsCheckin({Key? key, required this.book}) : super(key: key);

  final DocumentSnapshot book;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details', style: TextStyle(fontSize: 30.0),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              book['picture'],
              width: 300,
              height: 300,
              fit: BoxFit.contain,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Placeholder(fallbackWidth: 100, fallbackHeight: 150,);
              },
            ),
            Text("Title: " + book['title']),
            Text("Author: " + book['author']),
            Text("Year Published: " + book['year']),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text("Description: " + book['description']),
            ),
            Text("Date Checked Out: " + DateFormat('MM/dd/yyyy').format(book['checkoutdate'].toDate()).toString()),
            Text("Date Due: " + DateFormat('MM/dd/yyyy').format(book['duedate'].toDate()).toString()),

            ElevatedButton(
              child: Text("Check-in Book"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () async{
                final uid = FirebaseAuth.instance.currentUser!.uid;

                await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Checkouts").doc(book['title']).delete();
                Navigator.pop(context);
              },),
            FutureBuilder(
              future: FirebaseFirestore.instance.collection("Users").doc(uid).get(),
              builder:  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Container();
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  if(data['isAdmin']){
                    return ElevatedButton(
                      child: Text("Remove Book From Featured List"),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () async {
                        await FirebaseFirestore.instance.collection("FeaturedBooks")
                            .doc(book['title'])
                            .delete();
                        Navigator.pop(context);
                      },
                    );
                  }
                  return Container();
                }
                return Text("loading");
              },
            ),
          ],
        ),
      ),
    );
  }
}