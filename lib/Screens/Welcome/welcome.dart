import 'package:bookers/Screens/Sign%20Up/components/auth_ui_manager.dart';
import "package:flutter/material.dart";
import 'package:bookers/Screens/Welcome/components/welcome_body.dart';

class Welcome extends StatelessWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  WelcomeAuthUIManager()
    );
  }
}