import 'package:bookers/Screens/Home%20Page/homepage.dart';
import 'package:bookers/Screens/Sign%20Up/components/signup_body.dart';
import 'package:bookers/Screens/Welcome/components/welcome_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeAuthUIManager extends StatelessWidget {
  const WelcomeAuthUIManager({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } 

          else if(snapshot.hasData && FirebaseAuth.instance.currentUser != null) {
            return HomePage();
          }
          
          else if(snapshot.hasError) {
            return Center(child: Text("Error with SignUp "));
          }

          else {
            return WelcomeBody();
          }
        }
      ),
    );
  }
}

class SignUpAuthUIManager extends StatelessWidget {
  const SignUpAuthUIManager({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } 

          else if(snapshot.hasData && FirebaseAuth.instance.currentUser != null) {
            return HomePage();
          }
          
          else if(snapshot.hasError) {
            return Center(child: Text("Error with SignUp "));
          }

          else {
            return SignUpBody();
          }
        }
      ),
    );
  }
}