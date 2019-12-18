import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/add_admin.dart';
import 'package:newsapp/create_event.dart';
import 'package:newsapp/registered_team.dart';
import 'registered_team.dart';
import 'Check_items.dart';
/*
import 'package:vsporty/checkwinner.dart';

import 'package:vsporty/profile_page.dart';
import 'package:vsporty/register_event.dart';
import 'package:vsporty/registered_team.dart';
import 'avaliable_equipment.dart';


*/
class Dashboard extends StatefulWidget {
  static const id = 'dashboard';
  final FirebaseUser user;
  Dashboard({Key key, @required this.user}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 70.0,
            ),
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              child: Text('Add News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, CreateEvent.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              child: Text('Add Admin',style:TextStyle(fontWeight:FontWeight.bold) ,),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AdminScreen.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              child: Text('Delete News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              color: Colors.indigo,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, CheckItems.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              onPressed: () {
                Navigator.pushNamed(context, RegisteredTeamScreen.id);
              },
            ),
             SizedBox(
              height: 15.0,
            ),
            
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Trending News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              onPressed: () {
                //Navigator.pushNamed(context, RegisterScreen.id);
              },
            ),
            /*RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Issue Equipments'),
              onPressed: () {
                //Navigator.pushNamed(context, ItemScreen.id);
              },
            ),
            
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Registered Team'),
              onPressed: () {
                //Navigator.pushNamed(context, RegisteredTeamScreen.id);
              },
            ),
           RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Update Result'),
              onPressed: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, CheckWinner.id);
              },
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('Dashboard'),
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('Profile'),
              onPressed: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, ProfilePage.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
