import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/Pages/AddBookPage.dart';
import 'package:flutter_project/Pages/DetailedBookCheckoutPage.dart';
import 'Book.dart';
import 'DetailedBookCheckinPage.dart';


//Changes to make ordered by priority:
// Update checkout button on book details screen to give a notification if the book is already checked out.
// Fix profile page image resizing
// Remove title mctitleron and sean's autobiography from database

//Done:
// Add checkout timestamps and due dates to the checked out books.
// Add a forgot password button that sends recovery email to the associated account.
// Add persistence to logins, so that a user stays logged in if they leave the app and come back.
// Add error warnings to sign up page if a user tries to create an account with an already used email.
// Add sign up page with same error warnings as login page.
// Add error warnings to the login page for when a field is filled in incorrectly.
// Add error warnings to the login page for when a field is not filled.
// Make brand new login page.
// Remove bypass login button.
// Navigator.pushNamedReplacement in the login page, so there isn't a back button and people can't just leave the app without logging out.
// Create a button that only Admin accounts can see that allows them to Add a book to the all books list.
// Add search bar to AllBooksPage
// Create a button that only Admin accounts can see that allows them to remove a book from the all books list.
// Create button that only Admin accounts can see that allows them to add a book from the featured book list.
// Create button that only Admin accounts can see that allows them to remove a book from the featured book list.
// Make admin accounts
// Update Home Page to have book details when tapping on a book and a checkout book button on that detail screen.
// Update Home Page to pull featured books from firestore collection called FeaturedBooks.
// Make check-in button that either removes books from checkouts (CURRENTLY DOES THIS UPDATE IF ADMIN ACCOUNTS ARE IMPLEMENTED), or moves it to another collection that admins can then actually remove.
// Make Log Out button actually log out the user.
// Make detailed book page.
// Make a checkout book button that adds the book to a user database where users can see only the books they have checked out.
// Update mybooks to pull user specific checkouts and display it from firestore.
// Update mybooks to display images.
// Update first couple of entries in the database/JSON with description and picture.
// Create function to update the firestore with all the info we want from a JSON list.

//Anecdote about stuff that annoys me or small changes:
// Login Page should attempt login when you hit enter.
// main.dart remove profile page import
// The comma on the top of home page.
// Change count of books in database.dart



class BooksPage extends StatefulWidget{

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  TextEditingController _searchController = TextEditingController();

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getAllBookStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var bookSnapshot in _allResults) {
        var title = Book
            .fromSnapshot(bookSnapshot)
            .title
            .toLowerCase();

        if (title.contains(_searchController.text.toLowerCase())) {
          showResults.add(bookSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getAllBookStreamSnapshots() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Books').get();

    setState(() {
      _allResults = querySnapshot.docs;
    });
    searchResultsList();
    return "complete";
  }

  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('All Books',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
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
                        return IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddBookPage()));},icon: Icon(Icons.add));
                      }
                      return Container();
                    }
                    return Container();
                  },
                ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 30.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _resultsList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildBookCard(context, _resultsList[index])
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget buildBookCard(BuildContext context, DocumentSnapshot book) {
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
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Placeholder(fallbackWidth: 100,
                            fallbackHeight: 150,);
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
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0),
                            child: Row(
                                children: <Widget>[
                                  Flexible(fit: FlexFit.loose,
                                      child: Text(book['title'],
                                        style: TextStyle(fontSize: 20.0),)),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0),
                            child: Row(
                                children: <Widget>[
                                  Flexible(fit: FlexFit.loose,
                                      child: Text(book['author'])),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              onTap: () async {
                final DocumentSnapshot result = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Checkouts").doc(book['title']).get();
                if(result.exists){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ViewBookDetailsCheckin(book: result)));
                }
                else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewBookDetailsCheckout(book: book)));
                }
              }
            ),
          ),
        ),
      );
    }
  }