import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children:  <Widget>[
          /*Positioned(
            top: 30,
            left: 0,
            child: Image.asset("assets/images/Welcome/Vector1.png",),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/Welcome/Vector2.png",),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/Welcome/Ellipse1.png",),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/Welcome/Ellipse2.png", width: size.width * 0.45),
          ),
          Positioned(
            top: 0,
            right: -20,
            child: Image.asset("assets/images/Welcome/Ellipse3.png", width: size.width * 0.35),
          ),
          Positioned(
            child: Image.asset("assets/images/Welcome/text.png", width: size.width * 0.6),
          ),*/
          child
        ]
      )
    );
  }
}
