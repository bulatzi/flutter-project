import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Changes to make ordered by priority:
// Make Log Out button actually log out the user.
// Make a checkout book button that adds the book to a user database where users can see only the books they have checked out.
// Navigator.pushNamedReplacement in the login page, so there isn't a back button and people can't just leave the app without logging out.
// Make admin accounts
// Create button that only Admin accounts can see that allows them to add or remove a book from the featured book list. This list will probably be another collection in the database.
// Create a button that only Admin accounts can see that allows them to add or remove a book from the all books list.
//Remove title mctitleron and sean's autobiography from database
//Done:
// Create function to update the firestore with all the info we want from a JSON list.

//Anecdote about stuff that annoys me: The comma on the home page
class BooksPage extends StatelessWidget{
  //final List<Book> booksList = [
  //  Book("Do Androids Dream of Electric Sheep?", "Phillip K. Dick", 1968, "Do Androids Dream of Electric Sheep? is a dystopian science fiction novel by American writer Philip K. Dick, first published in 1968. The novel is set in a post-apocalyptic San Francisco, where Earth's life has been greatly damaged by a nuclear global war, leaving most animal species endangered or extinct."),
  //  Book("The Hitchhiker's Guide to the Galaxy", "Douglas Adams", 1978, "The Hitchhiker's Guide to the Galaxy is a comedy science fiction franchise created by Douglas Adams. Originally a 1978 radio comedy broadcast on BBC Radio 4, it was later adapted to other formats, including stage shows, novels, comic books, a 1981 TV series, a 1984 video game, and 2005 feature film."),
  //  Book("Something Wicked This Way Comes", "Ray Bradbury", 1962, "Something Wicked This Way Comes is a 1962 dark fantasy novel by Ray Bradbury. It is about two 13-year-old best friends, Jim Nightshade and William Halloway, and their nightmarish experience with a traveling carnival that comes to their Midwestern home, Green Town, Illinois, on October 24th."),
 //   Book("Pride and Prejudice and Zombies", "Seth Grahame-Smith", 2009, "Pride and Prejudice and Zombies is a 2009 parody novel by Seth Grahame-Smith. It is a mashup combining Jane Austen's classic 1813 novel Pride and Prejudice with elements of modern zombie fiction, crediting Austen as co-author."),
  //];
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('Books').orderBy('title').snapshots();
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _booksStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return new ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildBookCard(context, snapshot.data!.docs[index])
            );
          }
      ),
    );
  }

  Widget buildBookCard(BuildContext context, DocumentSnapshot book){
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(book['title'], style: new TextStyle(fontSize: 20.0),),),
                    Spacer(),
                    Icon(Icons.bookmark),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                    children: <Widget>[
                      Text(book['author']),
                      Spacer(),
                      Text(book['year'].toString()),
                    ]),
              ),
              Text(book['description']),
            ],
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