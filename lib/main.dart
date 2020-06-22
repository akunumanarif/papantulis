import 'package:flutter/material.dart';
import 'package:papantulis/screens/home_screen.dart';
import './homepage.dart';

import 'signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/homeScreen': (BuildContext context) => new HomeScreen(),
      },
      home: new MyHomePage(),
    );
  }
}


