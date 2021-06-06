import 'package:flutter/material.dart';
import 'package:guesstheword/screens/splash.dart';
import 'screens/Home.dart';
import 'screens/demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/home",
      routes: {
        // '/':(context)=>Loading();
      "/home":(context)=>HOME(),
      "/splash":(context)=>splashscreen()
      // "/demo":(context)=>Demo()
      },
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HOME(),
    );
  }
}






