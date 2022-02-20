import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'database_manager.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }
}

class GoogleSignUpProvider extends ChangeNotifier {
  
  final googleSignIn =  GoogleSignIn();
  var firebaseUser;
  GoogleSignInAccount? _user;
  
  GoogleSignInAccount get user => _user!;

  //Methods
  Future googleLogIn() async {
    final user = await googleSignIn.signIn();
    if(user == null) return;
    _user = user;

    final googleAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    firebaseUser = FirebaseAuth.instance.currentUser!;
    FirestoreManager.addUserCollection(user.displayName!, firebaseUser.uid, user.email, user.photoUrl!);
    notifyListeners();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}