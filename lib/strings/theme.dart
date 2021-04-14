import 'package:flutter/material.dart';

class Themes{
  final lightTheme=ThemeData.light().copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor : Colors.white,
    buttonColor: Colors.teal[600],
  );

  final darkTheme=ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[900],
    scaffoldBackgroundColor : Colors.blueGrey[900],
    buttonColor: Colors.yellow[800],
  );
}