import 'package:flutter/material.dart';
import 'package:newsapp/loginpage.dart';
import 'package:newsapp/signup_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'Welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Welcome',style:TextStyle(fontWeight: FontWeight.bold) ,),
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'V-News',
              style: TextStyle(fontSize: 60.0,color:Colors.indigo),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Center(
            child: RaisedButton(
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Login',style: TextStyle(fontWeight:FontWeight.bold),),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ),
          SizedBox(
            height: 17.0,
          ),
          Center(
              child: RaisedButton(
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Sign Up',style:TextStyle(fontWeight:FontWeight.bold) ,),
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
