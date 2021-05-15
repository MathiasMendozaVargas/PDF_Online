import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    Firebase.initializeApp();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.6, 0.6, 0.9],
                colors: [
                  Colors.red[900],
                  Colors.red[900],
                  Colors.red[800],
                  Colors.red[800]
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/pdf.png', width: 200),
                SizedBox(height: 30),
                Text(
                  'PDF Online',
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void startTimer() async{
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/loginPage');
    });
  }
}
