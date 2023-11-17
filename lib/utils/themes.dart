import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    displayLarge: const TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.grey.shade800),
  ),
);
