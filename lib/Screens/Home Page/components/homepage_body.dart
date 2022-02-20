import 'package:bookers/Screens/Home%20Page/components/Chat%20Section/chat_list.dart';
import 'package:bookers/Screens/Home%20Page/utilities/book_list_view.dart';
//import 'package:bookers/Screens/Home%20Page/utilities/prova.dart';
import 'package:bookers/constants.dart';
import 'package:bookers/utils/book_object.dart';
import 'package:bookers/utils/database_manager.dart';
import 'package:bookers/utils/authentication_manager.dart';
import 'package:bookers/utils/page_transition_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

Book book = Book("", "");

class HomePageBody extends StatefulWidget {
  const HomePageBody({ Key? key }) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  
  int _selectedIndex = 0;
  TextEditingController _textController = TextEditingController();
  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final user = FirebaseAuth.instance.currentUser!;
    final _widgetOptions = [
      Column(
        children: [
          /*Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              'Your Books',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800
              ),
            ),
          ),*/
          bookListView()
        ],
      ),
      Text(
        'Discover',
        //style: optionStyle,
      ),
      Text(
        'Discover',
        //style: optionStyle,
      ),
      Text(
        'Discover',
        //style: optionStyle,
      ),
      ElevatedButton(
        child: Text("Log Out"),
        onPressed: () {
          final provider = Provider.of<GoogleSignUpProvider>(context, listen: false);
          provider.googleLogout();
        },
      )
    ];

    return SafeArea(
      child: Scaffold(
        body:_widgetOptions.elementAt(_selectedIndex),

        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          shape: Border(bottom: BorderSide(color: kButtonColor, width: 1)),
          backgroundColor: Colors.white,
          title: Center(child: Text("Bookers")),
          actions: [
            IconButton(
              splashRadius: 20,
              splashColor: kButtonColor,
              onPressed: () {
                Navigator.push(context, RouteManager.leftToRight(() {return ChatList();}));
              }, 
              icon: Icon(Icons.chat_bubble_rounded, color: Colors.black),
            )
          ],
        ),

        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0), 
            topRight: Radius.circular(4.0), 
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.black45,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: size.height * 0.032,
                ),
                label: '',
                backgroundColor: kButtonColor
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                  size: size.height * 0.032,
                ),
                label: '',
                backgroundColor: kButtonColor
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_rounded,
                  size: size.height * 0.032,
                ),
                label: '',
                backgroundColor: kButtonColor
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.thumb_up_rounded,
                  size: size.height * 0.029,
                ),
                label: '',
                backgroundColor: kButtonColor
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_rounded,
                  size: size.height * 0.032,
                ),
                label: '',
                //backgroundColor: kButtonColor
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            backgroundColor: kButtonColor,
            onTap: _onItemTapped,
          ),
        ),

        floatingActionButton: _selectedIndex == 0 ?  FloatingActionButton.extended(
          onPressed: () {
            bookDialog(context, _textController);
          },
          label: const Text('Add a book'),
          icon: const Icon(Icons.add),
          backgroundColor: kButtonColor,
        ) : null,
      )
    );
  }
}

Future<void> bookDialog(BuildContext context, TextEditingController _textController) async {
  final _formKey = GlobalKey<FormState>();
  
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: _addBookDialog(context, _textController, _formKey),
      );
    },
  );
}

Widget _addBookDialog(BuildContext context, TextEditingController _textController, GlobalKey<FormState> _key) => Container(
  height: 300,
  decoration: BoxDecoration(
    color:  Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  child: Column(
    children: <Widget>[
      SizedBox(height: 24),
      Text(
        "Add a book",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      SizedBox(height: 10),
      Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
              child: TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty) return "Please enter some text";
                  return null;
                },
                onSaved: (value) {
                  book.setTitle = value!;
                },
                maxLines: 1,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Title',
                  floatingLabelStyle: TextStyle(color: kButtonColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: kButtonColor) 
                  ),
                ),
              )
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty) return "Please enter some text";
                  return null;
                },
                onSaved: (value) {
                  book.setAuthor = value!;
                },
                maxLines: 1,
                autofocus: false,
                keyboardType: TextInputType.text,
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Author',
                  floatingLabelStyle: TextStyle(color: kButtonColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: kButtonColor) 
                  ),
                ),
              )
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  child: Text(
                    "Save".toUpperCase(),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kButtonColor)
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      var user = FirebaseAuth.instance.currentUser!;
                      FirestoreManager.addBook(user.uid, book);
                      return Navigator.of(context).pop(true);
                    }
                  },
                )
              ],
            )
          ],  
        ),
      ),
    ],
  ),
);