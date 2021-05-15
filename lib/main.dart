import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_application/screens/initPage.dart';
import 'package:pdf_application/screens/homePage.dart';
import 'package:pdf_application/screens/loginPage.dart';


User user;

void main(user) => runApp(MaterialApp(
  initialRoute: '/initPage',
  routes: {
    '/initPage': (context) => InitPage(),
    '/loginPage': (context) => LoginPage(),
    '/homePage': (context) => HomePage(user)
  },
));