import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ViewBookDetailsCheckout extends StatelessWidget{

  ViewBookDetailsCheckout({Key? key, required this.book}) : super(key: key);

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

            ElevatedButton(
              child: Text("Checkout Book"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () async{

                await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Checkouts").doc(book['title']).set(
                    {
                      'title': book['title'],
                      'author': book['author'],
                      'year': book['year'],
                      'description': book['description'],
                      'picture': book['picture'],
                      'checkoutdate': DateTime.now(),
                      'duedate': DateTime.now().add(Duration(days: 7)),
                    }
                );
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
                      child: Text("Add Book To Featured List"),
                      style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                      onPressed: () async {
                        await FirebaseFirestore.instance.collection("FeaturedBooks")
                            .doc(book['title'])
                            .set(
                            {
                              'title': book['title'],
                              'author': book['author'],
                              'year': book['year'],
                              'description': book['description'],
                              'picture': book['picture']
                            }
                        );
                        Navigator.pop(context);
                      },
                    );
                  }
                  return Container();
                }
                return Text("loading");
              },
            ),

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
                      child: Text("Delete Book Data"),
                      style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                      onPressed: () async {
                        showAlertDialog(context);
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
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();//dismiss dialogue
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () async{
        await FirebaseFirestore.instance.collection("Books")
            .doc(book['title'])
            .delete();

        await FirebaseFirestore.instance.collection("FeaturedBooks")
            .doc(book['title'])
            .delete();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Book?"),
      content: Text("Are you sure you would like to delete this book?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}