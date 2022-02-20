import 'package:bookers/utils/authentication_manager.dart';
import 'package:flutter/material.dart';
import "package:bookers/Screens/Welcome/welcome.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Authentication.initializeFirebase().whenComplete(
    () => {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]).then((value) => runApp(const App()))
    });
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignUpProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Proto',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme
          )
        ),
        home: Welcome()
      ),
    );
  }
}
