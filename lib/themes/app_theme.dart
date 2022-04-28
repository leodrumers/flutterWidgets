import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigoAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryColor)));
}
