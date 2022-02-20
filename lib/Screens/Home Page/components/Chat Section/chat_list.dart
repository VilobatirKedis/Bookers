import 'package:flutter/material.dart';
import 'package:bookers/constants.dart';

import 'chat_list_view.dart';

class ChatList extends StatelessWidget {
  const ChatList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: kButtonColor, width: 2)),
        backgroundColor: Colors.white,
        title: Text("Chats", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: ChatListView(),
    );
  }
}