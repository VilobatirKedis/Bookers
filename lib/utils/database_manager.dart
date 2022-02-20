import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'book_object.dart';

class FirestoreManager extends ChangeNotifier {
  static Future<void> addUserCollection(String name, String id, String email, String photoUrl) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return users
      .doc(id)
      .set({
        "id": id,
        "displayName": name,
        "email": email,
        "image": photoUrl
      })
      .then((value) => {
        addUserDocs(id)
      })
      .catchError((error) => print("Error"));
  }

  static Future<void> addUserDocs(String id) {
    CollectionReference user = FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .collection("booksToShare");

    return user
      .doc("dummy")
      .set({
        "dummy": true
      })
      .then((value) => {
        addUserChats(id)
      })
      .catchError((error) => print("Error"));                      
  }

  static Future<void> addUserChats(String id) {
    CollectionReference user = FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .collection("chats");

    return user
      .doc("dummy")
      .set({
        "dummy": true
      })
      .then((value) => {
      })
      .catchError((error) => print("Error"));                      
  }

  static Future<void> addBook(String id, Book book) {
    CollectionReference user = FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .collection("booksToShare");

    return user
      .add({
        "title": book.title,
        "author": book.author
      })
      .then((value) => {
      })
      .catchError((error) => print("Error"));  
  }
}

