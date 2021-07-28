import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/Pages/DetailedBookPage.dart';
import 'package:flutter_project/theme.dart' as Theme;


//Changes to make ordered by priority:
// Make Log Out button actually log out the user.
// HALF DONE Make a checkout book button that adds the book to a user database where users can see only the books they have checked out.
// Make checkin button that either removes books from checkouts, or moves it to another collection that admins can then actually remove.
// Navigator.pushNamedReplacement in the login page, so there isn't a back button and people can't just leave the app without logging out.
// Make admin accounts
// Create button that only Admin accounts can see that allows them to add or remove a book from the featured book list. This list will probably be another collection in the database.
// Create a button that only Admin accounts can see that allows them to add or remove a book from the all books list.
// Remove title mctitleron and sean's autobiography from database

//Done:
// Update mybooks to pull user specific checkouts and display it from firestore.
// Update mybooks to display images.
// Update first couple of entries in the database/JSON with description and picture.
// Create function to update the firestore with all the info we want from a JSON list.

//Anecdote about stuff that annoys me or small changes:
// Login Page should attempt login when you hit enter.
// main.dart remove profile page import
// The comma on the top of home page.
// Change count of books in database.dart



class BooksPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('Books').orderBy('title').snapshots();
    return MaterialApp(
      title: 'AllBooksPage',
      color: Theme.CompanyColors.green[200],
      theme: Theme.CompanyThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ALL BOOKS',
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
                        buildBookCard(context, snapshot.data!.docs[index])
                );
              }
          ),
        ),
      ),
    );
  }

  Widget buildBookCard(BuildContext context, DocumentSnapshot book){
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
                  Image.network(
                    book['picture'],
                    width: 100,
                    height: 150,
                    fit: BoxFit.contain,
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
                          Text(book['title'], style: TextStyle(fontSize: 20.0),),
                          Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                          children: <Widget>[
                            Text(book['author']),
                            Spacer(),
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


/*
Future<List<String>> getBooks() async {
  // Opens a reference to the database, and pulls all the data from the books directory
  final data = await FirebaseDatabase.instance
      .reference()
      .child("Books")
      .get();

  // Makes an empty list
  List<String> bookList = [];

  //This adds the titles of all the books to a list
  new Map<String, dynamic>.from(data?.value).forEach((key, values) {
    //print(values['title']);
    bookList.add(values['title']);
  });

  return bookList;
}
class BooksView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: StreamBuilder(
        stream:
      )
    )
  }
}
class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('Books')
        .where('searchKey',
        isEqualTo: searchField.substring(0, 1).toUpperCase())
        .get();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Title'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Firestore search'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList())
        ]));
  }
}

Widget Build

Widget buildResultCard(data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
          child: Center(
              child: Text(data['Title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              )
          )
      )
  );
}*/