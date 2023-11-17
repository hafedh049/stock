import 'package:flutter/material.dart';
import 'package:stock/utils/colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey.shade800,
  hintColor: Colors.blue,
  scaffoldBackgroundColor: bgColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white70),
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    displayLarge: const TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.grey.shade800),
    // Define other text styles for your app
  ),
);
