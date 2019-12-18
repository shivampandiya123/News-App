import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'teamdata.dart';

class RegisteredTeamScreen extends StatefulWidget {
  static const id = "Registeredteam";
  @override
  _RegisteredTeamScreenState createState() => _RegisteredTeamScreenState();
}

class _RegisteredTeamScreenState extends State<RegisteredTeamScreen> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("News",),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('news').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> teams = List();
            for (var d in data) {
              if(d.data['show']){
              teams.add(
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Text(
                          d.data['title'] +
                          "     "+d.data['date'],
                          style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),
                        ),
                        Text(
                          d.data['time'],
                          style: TextStyle(fontSize: 15.0,color:Colors.indigo,fontWeight:FontWeight.bold ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamScreen(
                            name: d.data['title'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: teams,
            );
          },
        ),
      ),
    );
  }
}
