import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/data.dart' as dt;

//Paths in the database
const String _booksPath = "books/";

// Class for storing book information
class BookInfo {
  // Member variables
  String title = "";
  String author = "";
  String year = "";
  String description = "";
  String picture = "";

  // A constructor that takes data from firebase and formats it in to a BookInfo class
  BookInfo(DataSnapshot? data) {
    title = data?.value['title'];
    author = data?.value['author'];
    year = data?.value['year'];
    description = data?.value['description'];
    picture = data?.value['picture'];
  }

  // This overwrites the default toString implementation so you can use print() with this class
  @override
  String toString() {
    return "title: \"$title\"\n"
        "author: \"$author\"\n"
        "year: \"$year\"\n"
        "description: \"$description\"\n"
        "picture: \"$picture\"\n";
  }
}

// Loads the default data in to the database.
// Don't call this unless the data is corrupted, or you need to change something
void LoadBooks() async {
  // opens a connection to the database
  await Firebase.initializeApp();
  final FirebaseDatabase database = FirebaseDatabase.instance;

  // Stores hardcoded book values in the database
  final List<Map<String, Object>> books = [
    {'title': 'Harry Potter and the Sorcerer\'s Stone',
      'author': 'J. K. Rowling',
      'year': '1997',
      'description': 'An orphan gets kidnapped by a large bearded man who tells him he\'s a wizard.',
      'picture':''},
    {'title': 'Harry Potter and the Chamber of Secrets',
      'author': 'J. K. Rowling',
      'year': '1998',
      'description': '',
      'picture':''},
    {'title': 'Harry Potter and the Prisoner of Azkaban',
      'author': 'J. K. Rowling',
      'year': '1999',
      'description': '',
      'picture':''},
    {'title': 'Harry Potter and the Goblet of Fire',
      'author': 'J. K. Rowling',
      'year': '2000',
      'description': '',
      'picture':''},
    {'title': 'Harry Potter and the Order of the Phoenix',
      'author': 'J. K. Rowling',
      'year': '2003',
      'description': '',
      'picture':''},
    {'title': 'Harry Potter and the Half-Blood Prince',
      'author': 'J. K. Rowling',
      'year': '2005',
      'description': '',
      'picture':''},
    {'title': 'Harry Potter and the Deathly Hallows',
      'author': 'J. K. Rowling',
      'year': '2007',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: The Eye of the World',
      'author': 'Robert Jordan',
      'year': '1990',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: The Great Hunt',
      'author': 'Robert Jordan',
      'year': '1990',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: The Dragon Reborn',
      'author': 'Robert Jordan',
      'year': '1991',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time:The Shadow Rising',
      'author': 'Robert Jordan',
      'year': '1992',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: The Fires of Heaven',
      'author': 'Robert Jordan',
      'year': '1993',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: Lord of Chaos',
      'author': 'Robert Jordan',
      'year': '1994',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: A Crown of Swords',
      'author': 'Robert Jordan',
      'year': '1994',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: The Path of Daggers',
      'author': 'Robert Jordan',
      'year': '1998',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: Winter\'s Heart',
      'author': 'Robert Jordan',
      'year': '2000',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: Crossroads of Twilight',
      'author': 'Robert Jordan',
      'year': '2003',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: Knife of Dreams',
      'author': 'Robert Jordan',
      'year': '2005',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: The Gathering Storm',
      'author': 'Robert Jordan and Brandon Sanderson',
      'year': '2009',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: Towers of Midnight',
      'author': 'Robert Jordan and Brandon Sanderson',
      'year': '2010',
      'description': '',
      'picture':''},
    {'title': 'Wheel of time: A Memory of Light',
      'author': 'Robert Jordan and Brandon Sanderson',
      'year': '2013',
      'description': '',
      'picture':''},
    {'title': 'Eragon',
      'author': 'Christopher Paolini',
      'year': '2001',
      'description': '',
      'picture':''},
    {'title': 'Eragon: Eldest',
      'author': 'Christopher Paolini',
      'year': '2005',
      'description': '',
      'picture':''},
    {'title': 'Eragon: Brisingr',
      'author': 'Christopher Paolini',
      'year': '2008',
      'description': '',
      'picture':''},
    {'title': 'Eragon: Inheritance',
      'author': 'Christopher Paolini',
      'year': '2011',
      'description': '',
      'picture':''},
    {'title': 'The Fellowship of the Ring',
      'author': 'J. R. R. Tolkien',
      'year': '1954',
      'description': '',
      'picture':''},
    {'title': 'The Two Towers',
      'author': 'J. R. R. Tolkien',
      'year': '1954',
      'description': '',
      'picture':''},
    {'title': 'The Return of the King',
      'author': 'J. R. R. Tolkien',
      'year': '1955',
      'description': '',
      'picture':''},
    {'title': 'Ringworld',
      'author': 'Larry Niven',
      'year': '1970',
      'description': '',
      'picture':''},
    {'title': 'Halo: The Fall of Reach',
      'author': 'Eric Nylund',
      'year': '2001',
      'description': '',
      'picture':''},
    {'title': 'Halo: The Flood',
      'author': 'William C. Dietz',
      'year': '2003',
      'description': '',
      'picture':''},
    {'title': 'Halo: First Strike',
      'author': 'Eric Nylund',
      'year': '2003',
      'description': '',
      'picture':''},
    {'title': 'Halo: Ghosts of Onyx',
      'author': 'Eric Nylund',
      'year': '2006',
      'description': '',
      'picture':''},
    {'title': 'Red Rising',
      'author': 'Pierce Brown',
      'year': '2014',
      'description': '',
      'picture':''},
    {'title': 'Red Rising: Golden Son',
      'author': 'Pierce Brown',
      'year': '2015',
      'description': '',
      'picture':''},
    {'title': 'Red Rising: Morning Star',
      'author': 'Pierce Brown',
      'year': '2016',
      'description': '',
      'picture':''},
    {'title': 'Dune',
      'author': 'Frank Herbert',
      'year': '1965',
      'description': '',
      'picture':''},
    {'title': 'Dune Messiah',
      'author': 'Frank Herbert',
      'year': '1969',
      'description': '',
      'picture':''},
    {'title': 'Children of Dune',
      'author': 'Frank Herbert',
      'year': '1976',
      'description': '',
      'picture':''},
    {'title': 'God Emperor of Dune',
      'author': 'Frank Herbert',
      'year': '1981',
      'description': '',
      'picture':''},
    {'title': 'Heretics of Dune',
      'author': 'Frank Herbert',
      'year': '1984',
      'description': '',
      'picture':''},
    {'title': 'Chapterhouse: Dune',
      'author': 'Frank Herbert',
      'year': '1985',
      'description': '',
      'picture':''},
    {'title': 'A Game of Thrones',
      'author': 'George R. R. Martin',
      'year': '1996',
      'description': '',
      'picture':''},
    {'title': 'A Clash of Kings',
      'author': 'George R. R. Martin',
      'year': '1999',
      'description': '',
      'picture':''},
    {'title': 'A Storm of Swords',
      'author': 'George R. R. Martin',
      'year': '2000',
      'description': '',
      'picture':''},
    {'title': 'A Feast for Crows',
      'author': 'George R. R. Martin',
      'year': '2005',
      'description': '',
      'picture':''},
    {'title': 'A Dance with Dragons',
      'author': 'George R. R. Martin',
      'year': '2011',
      'description': '',
      'picture':''},
    {'title': 'A Wizard of Earthsea',
      'author': 'Ursula K. Le Guin',
      'year': '1968',
      'description': '',
      'picture':''},
    {'title': 'The Tombs of Atuan',
      'author': 'Ursula K. Le Guin',
      'year': '1970',
      'description': '',
      'picture':''},
    {'title': 'The Farthest Shore',
      'author': 'Ursula K. Le Guin',
      'year': '1972',
      'description': '',
      'picture':''},
    {'title': 'Tehanu',
      'author': 'Ursula K. Le Guin',
      'year': '1990',
      'description': '',
      'picture':''},
    {'title': 'The Other Wind',
      'author': 'Ursula K. Le Guin',
      'year': '2001',
      'description': '',
      'picture':''},
    {'title': 'Neuromancer',
      'author': 'William Gibson',
      'year': '1984',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: The Final Empire',
      'author': 'Brandon Sanderson',
      'year': '2006',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: The Well of Ascension',
      'author': 'Brandon Sanderson',
      'year': '2007',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: The Hero of Ages',
      'author': 'Brandon Sanderson',
      'year': '2008',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: The Alloy of Law',
      'author': 'Brandon Sanderson',
      'year': '2011',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: Shadows of Self',
      'author': 'Brandon Sanderson',
      'year': '2015',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: The Bands of Mourning',
      'author': 'Brandon Sanderson',
      'year': '2016',
      'description': '',
      'picture':''},
    {'title': 'Mistborn: Secret History',
      'author': 'Brandon Sanderson',
      'year': '2016',
      'description': '',
      'picture':''},
    //////////////////////////////61 books
  ];

  //Saves all book info in firebase with the title of the book as the path for the information
  await Future.wait(books.map((map) {
    String child = map['title']! as String;
    return database.reference().child('$_booksPath/$child').set(map);
  }));
}

// Gets a list of all book titles
Future<List<String>> getBooks() async {
  // Opens a reference to the database, and pulls all the data from the books directory
  final data = await FirebaseDatabase.instance
    .reference()
    .child(_booksPath)
    .get();

  // Makes an empty list
  List<String> bookList = [];

  //This adds the titles of all the books to a list
  new Map<String, dynamic>.from(data?.value).forEach((key, values) {
    //print(values['title']);
    bookList.add(values['title']);
    dt.benji.add(values['title']);
  });

  return bookList;
}

// Gets the data for a specific book
Future<BookInfo> getBook(String title) async {
  // Opens the database and gets book data
  final data = await FirebaseDatabase.instance
      .reference()
      .child('$_booksPath$title')
      .get();

  // Formats the firebase data in to a BookInfo object, and returns it
  return new BookInfo(data);
}

