import 'package:flutter/material.dart';
import 'package:pdf_application/backend/auth.dart';
import 'package:pdf_application/screens/homePage.dart';


Widget SignWithGoogle(context, user, route){
  TextStyle style = TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold);

  return SizedBox(
    height: 50,
    width: MediaQuery.of(context).size.width,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        signInWithGoogle().then((user) => {
          print(user.displayName),
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user)))
        });
      },
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/google-logo.png', height: 25.0),
          SizedBox(width: 10),
          Text(
            'Sign in with Google',
            style: style.copyWith(color: Colors.black),
          )
        ],
      ),

    ),
  );
}
