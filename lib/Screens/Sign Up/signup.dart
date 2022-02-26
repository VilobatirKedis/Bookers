import 'package:bookers/Screens/Sign%20Up/components/auth_ui_manager.dart';
import "package:flutter/material.dart";

class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SignUpAuthUIManager(),
    );
  }
}