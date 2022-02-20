import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class bookListViewProva extends StatefulWidget {
  const bookListViewProva({ Key? key }) : super(key: key);

  @override
  _bookListViewStateProva createState() => _bookListViewStateProva();
}

class _bookListViewStateProva extends State<bookListViewProva> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection("booksToShare").snapshots();

  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Widget> _items = [];
  List<Widget> _itemsToIns = [];
  int counter = 0;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //addBooks();
    });
  }
  
  void addBooks() {
    _items.add(ListTile(
      title: Text("data['title']"),
      subtitle: Text("data['author']"),
    ));

    _items.add(ListTile(
      title: Text("data['title']"),
      subtitle: Text("data['author']"),
    ));

    _items.add(ListTile(
      title: Text("data['title']"),
      subtitle: Text("data['author']"),
    ));

    _items.forEach((element) {
      _itemsToIns.add(element);
      print(_itemsToIns);
      //listKey.currentState!.insertItem(_itemsToIns.length - 1);
    });
  }

  void crawlBooks(snapshot, animation) {
    snapshot.data!.docs.map((DocumentSnapshot document) {
      if(document.id != "dummy") {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        print(data);
        Widget tile = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset(0, 0),
          ).animate(animation),
          child: ListTile(
            title: Text(data['title']),
            subtitle: Text(data['author']),
          )
        );

        _items.add(tile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("CIAO");
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Flexible(
          child: AnimatedList(
            key: listKey,
            itemBuilder: (context, index, animation) {
              _items.add(ListTile(
                title: Text("data['title']"),
                subtitle: Text("data['author']"),
              ));

              _items.add(ListTile(
                title: Text("data['title']"),
                subtitle: Text("data['author']"),
              ));

              _items.add(ListTile(
                title: Text("data['title']"),
                subtitle: Text("data['author']"),
              ));

              _items.forEach((element) {
                _itemsToIns.add(element);
                print(_itemsToIns);
                listKey.currentState!.insertItem(_itemsToIns.length - 1);
              });

              return _itemsToIns[index];
            }
          ),
        );
      },
    );
  }
}