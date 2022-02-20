import 'package:bookers/Screens/Welcome/welcome.dart';
import 'package:bookers/constants.dart';
import 'package:bookers/utils/authentication_manager.dart';
import 'package:bookers/utils/page_transition_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BackButton(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w700
                      )
                    ),
                  )
                ]
              ),

              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05, left: size.width * 0.01),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign up with one of the following",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FacebookSignUpButton(size: size),

                    GoogleSignUpButton(size: size),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        color: kAuthButtonsBackground 
      ),
      child: IconButton(
        onPressed: () {
          final provider = Provider.of<GoogleSignUpProvider>(context, listen: false);
          provider.googleLogIn();
        }, 
        icon:  Image.asset("assets/icons/google.png"),
        padding: EdgeInsets.only(left: size.width * 0.192, right: size.width * 0.192),
      ),
    );
  }
}

class FacebookSignUpButton extends StatelessWidget {
  const FacebookSignUpButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        color: kAuthButtonsBackground 
      ),
      child: IconButton(
        onPressed: () {}, 
        icon:  Image.asset("assets/icons/facebook.png"),
        padding: EdgeInsets.only(left: size.width * 0.192, right: size.width * 0.192),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Ink(
      width: size.width * 0.150,
      height: size.height * 0.07,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: kButtonColor
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(context, RouteManager.rightToLeft(() {return Welcome();}));
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: size.width * 0.08,
        ),
      ),
    );
  }
}