import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/dashboard.dart';

class AdminScreen extends StatelessWidget {
  static const id = 'admin';
  final _firestore = Firestore.instance;
  String _name;
  String _email;
  String _pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Add Admin',),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Full Name'),
            onChanged: (val) {
              _name = val;
            },
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: 'Email'),
            onChanged: (val) {
              _email = val;
            },
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
            onChanged: (val) {
              _pass = val;
            },
          ),
          RaisedButton(
            color: Colors.indigo,
            textColor: Colors.white,
            child: Text('Submit',style:TextStyle(fontWeight:FontWeight.bold ) ,),
            onPressed: () async {
              final check = await _firestore
                  .collection('admin')
                  .where('email', isEqualTo: _email)
                  .getDocuments();
              if (check.documents.isEmpty) {
                final data = await _firestore.collection('admin').add(
                  {
                    'name': _name,
                    'email': _email,
                    'password': _pass,
                  },
                );
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
