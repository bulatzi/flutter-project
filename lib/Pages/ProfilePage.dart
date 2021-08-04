import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Authentication/authservice.dart';
import 'package:flutter_project/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final ButtonStyle style =
    ElevatedButton.styleFrom(primary: Colors.green, textStyle: const TextStyle(fontSize: 20));

    Widget userProfile = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Image(  //default user image
              image: NetworkImage(
                  'https://i.dlpng.com/static/png/5066062-user-profile-icon-png-download-fa-user-circle-o-free-profile-icon-png-820_861_preview.png'),
                height: 200,
                width: 200,
              ),
            ),
          ),

          SizedBox(height: 10), //space between picture and user name
          FutureBuilder(
            future: AuthService().getCurrentUser(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return displayUserInformation(context, snapshot);
              }else {
                return CircularProgressIndicator();
              }
            }
          ),

          SizedBox(height: 30),

          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green[200], textStyle: const TextStyle(fontSize: 15)),
            onPressed: (){
              userEditBottomSheet();
            },
            child: Text("Edit Name"),
          ),

          SizedBox(height: 15),

          ElevatedButton( //log out button
            style: style,
            onPressed: () {
              AuthService().signOut();
            },
            child: const Text('Log Out'),

          ),
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('User Profile',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.moon_stars),
              onPressed: (){
                bool value = themeProvider.isDarkMode;
                final provider = Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            userProfile,
          ],
        ),
      );
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;

  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Name: ${user.displayName ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
      ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Created: ${DateFormat('MM/dd/yyyy').format(
              user.metadata.creationTime)}", style: TextStyle(fontSize: 20),),
        ),
      ],
    );
  }

  userEditBottomSheet(){
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .60,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Update Name"),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.orange,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            helperText: "Name",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Save'),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () async {
                        name = _userNameController.text;
                        setState(() {
                          _userNameController.text = name!;
                        });
                        AuthService().updateUserName(name!);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}