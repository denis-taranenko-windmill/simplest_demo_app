import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: _primaryColor,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.grey),
    foregroundColor: Colors.black,
  ),
  textTheme: const TextTheme(
    button: TextStyle(fontSize: 16),
    headline4: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    bodyText2: _bodyText2,
    headline6: TextStyle(color: Colors.black, fontSize: 24), // AppBar, AlertDialogs
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: _primaryColor)),
    hintStyle: _bodyText2.copyWith(
      color: Colors.black.withOpacity(0.4),
    ),
  ),
);

const _bodyText2 = TextStyle(fontSize: 14);
const _primaryColor = Colors.lightGreen;
