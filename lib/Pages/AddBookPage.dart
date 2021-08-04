import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'AllBooksPage.dart';

class AddBookPage extends StatefulWidget {

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  late String _title, _author, _description, _year, _picture;
  final formKey = GlobalKey<FormState>();

  void submit() async{
   final form = formKey.currentState;
   form!.save();
    try{
      await FirebaseFirestore.instance.collection('Books').doc(_title).set({
        'title': _title,
        'author': _author,
        'year': _year,
        'description': _description,
        'picture': _picture,
      });

      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => BooksPage()));
    }catch(e) {
     print(e);
   }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Add New Book', style: TextStyle(
        fontSize: 30,
      ),)),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[50],
          height: _height,
          width: _width,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: _height * .05,),
                SizedBox(height: _height * .05,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: buildInputs() + buildSubmitButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];

    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: InputDecoration(
          hintText: "Title",
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.0)),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0)
      ),
      onSaved: (value) => _title = value!,
    ));

    textFields.add(SizedBox(height: 20,));

    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: InputDecoration(
          hintText: "Author",
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.0)),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0)
      ),
      onSaved: (value) => _author = value!,
    ));

    textFields.add(SizedBox(height: 20,));

    textFields.add(TextFormField(
      maxLines: 5,
      style: TextStyle(fontSize: 22.0),
      decoration: InputDecoration(
          hintText: "Description",
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.0)),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
      ),
      onSaved: (value) => _description = value!,
    ));

    textFields.add(SizedBox(height: 20,));

    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: InputDecoration(
          hintText: "Year",
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.0)),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0)
      ),
      onSaved: (value) => _year = value!,
    ));

    textFields.add(SizedBox(height: 20,));

    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: InputDecoration(
          hintText: "Picture URL",
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.0)),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0)
      ),
      onSaved: (value) => _picture = value!,
    ));
    return textFields;
  }

  List<Widget> buildSubmitButton() {
    return [Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          child: Text("Create Book", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),),
          onPressed: submit,
        ),
      ),
    )];
  }
}

