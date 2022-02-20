import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class bookListView extends StatefulWidget {
  const bookListView({ Key? key }) : super(key: key);

  @override
  _bookListViewState createState() => _bookListViewState();
}

class _bookListViewState extends State<bookListView> {
  final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection("booksToShare").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _booksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: kButtonColor));
        }

        return Flexible(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              if(document.id != "dummy") {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['title']),
                  subtitle: Text(data['author']),
                  onLongPress: () {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) => Dialog(
                        child: Column(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {
                              },
                            ),
                          ],
                        )
                      )
                    );
                  },
                );
              }

              else {
                return SizedBox();
              }
            }).toList(),
          ),
        );
      },
    );
  }
}