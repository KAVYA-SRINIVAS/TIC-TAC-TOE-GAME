import 'package:flutter/material.dart';
import 'package:tictactoe/home_page.dart';
import 'package:tictactoe/splashscreen.dart';
import 'package:tictactoe/welcome.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.black),
      home: new SplashScreen(),
    );
  }
}
