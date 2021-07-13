//import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

final databaseReference = FirebaseDatabase.instance.reference();

void GetBook(String title) async{
  //Retrieve book table, add something to it, set the table
  print(title);

  //var bookTable = await databaseReference.child("Books");
  //var result = await bookTable.child("test").once();

  final DatabaseReference db = FirebaseDatabase().reference();

  final FirebaseApp app;
  //db.child('Books').once().then((result) => print('result = $result'));

  Map<String, int> temp = {
    'one': 1,
    'two': 2,
    'three': 3,
  };

  db.set(temp);

  print(title);
  //print(result);
}