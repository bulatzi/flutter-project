import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String title;
  final String author;
  final String year;
  final String description;
  final String picture;


  Book(this.title, this.author, this.year, this.description, this.picture);

  // creating a Book object from a firebase snapshot
  Book.fromSnapshot(DocumentSnapshot snapshot) :
      title = snapshot['title'],
      author = snapshot['author'],
      year = snapshot['year'],
      description = snapshot['description'],
      picture = snapshot['picture'];
}