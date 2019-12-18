import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckItems extends StatefulWidget {
  static const id = 'checkItems';
  @override
  _CheckItemsState createState() => _CheckItemsState();
}

class _CheckItemsState extends State<CheckItems> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Delete News',),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('news').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> stock = List();
            for (var d in data) {
              if (d.data['show']) {
                stock.add(
                  GestureDetector(
                    onTap: () async {
                      final data = await _firestore
                          .collection('news')
                          .where('title', isEqualTo: d.data['title'])
                          .getDocuments();
                      final data1 = await _firestore
                          .collection('news')
                          .document(data.documents[0].documentID)
                          .updateData(
                        {'show': false},
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            d.data['title'],
                            style: TextStyle(fontSize: 17.0),
                            
                          ),
                        ),
                        Expanded(
                          child: Text(
                            d.data['date'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            d.data['time'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        SizedBox(height:40),
                      ],
                    ),
                  ),
                );
              }
            }
            return Column(
              children: stock,
            );
          },
        ),
      ),
    );
  }
}
