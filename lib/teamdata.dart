import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

class TeamScreen extends StatefulWidget {
  static const id = "Team screen";
  String name = "";
  TeamScreen({this.name});
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  int likes=0;
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("News Detail" ,),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('news').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> teams = List();
            for (var d in data) {
              if (d.data['title'].compareTo(widget.name) == 0) {
                teams.add(
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          d.data['title'],
                          style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Colors.indigo ) 
                        ),
                        SizedBox(height:21,),
                         Text (d.data['text'],
                          style: TextStyle(fontSize: 17.0),
                        ),
                        SizedBox(height:25,),
                        Text("Likes :"+
                          d.data['likes'].toString(),
                          style: TextStyle(fontSize: 15.0,fontWeight:FontWeight.bold),
                        ),
                        RaisedButton(
                            color: Colors.indigo,
                            textColor: Colors.white,
                            child: Text('Like',style:TextStyle(fontWeight:FontWeight.bold ) ,),
                            onPressed: () async {
                              likes=d.data['likes']+1;
                              final val = await _firestore
                                  .collection('news')
                                  .where('title', isEqualTo:widget.name)
                                  .getDocuments();
                              if (!val.documents.isEmpty ) {
                                    final data = await _firestore
                                      .collection('news')
                                      .document(val.documents[0].documentID)
                                      .updateData({'likes': likes});
                              }
                              Navigator.pop(context);
                            }, 
                          ),
                      ],
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
