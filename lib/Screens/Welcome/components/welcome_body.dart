import 'dart:ui';

import 'package:bookers/Screens/Sign%20Up/components/auth_ui_manager.dart';
import 'package:bookers/Screens/Sign%20Up/signup.dart';
import 'package:bookers/Screens/Welcome/components/background.dart';
import 'package:bookers/utils/page_transition_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookers/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.2),
            child: Header(),
          ),

          Padding(
            padding: EdgeInsets.only(top: size.height * 0.05),
            child: SignUpButton(),
          ),

          Padding(
            padding: EdgeInsets.only(top: 5),
            child: SignInButton(),
          )
        ],
      )
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return RichText(
      textAlign: TextAlign.center,
      text: /*TextSpan(text: "Hello")*/TextSpan(
        text: "Your place to",
        style: GoogleFonts.montserrat(
          textStyle: Theme.of(context).textTheme.bodyText1,
          fontSize: size.width * 0.14,
          fontWeight: FontWeight.w300
        ),
        children: <TextSpan>[
          TextSpan(
            text: " share ",
            style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.bodyText1,
              fontSize: size.width * 0.15,
              fontWeight: FontWeight.w700,
              color: kButtonColor
            )
          ),
          TextSpan(
            text: "books"
          ),
        ]
      )
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(context, RouteManager.leftToRight(() {return SignUp();}));
      },
      label: Icon(
        Icons.arrow_right_alt_rounded,
        size: size.width * 0.07
      ),
      icon: Text(
        "Sign Up",
        style: TextStyle(
          fontSize: size.width * 0.05
        )
      ), 
      style: ElevatedButton.styleFrom(
        primary: kButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        padding: kButtonInset
      )
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {return Scaffold();}));
      }, 
      child: Text(
        "Sign In",
        style: TextStyle(
          fontSize: size.width * 0.04
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: kSecondaryButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        padding: kSecondaryButtonInset
      )
    );
  }
}