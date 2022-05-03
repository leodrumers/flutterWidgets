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
      style: TextButton.styleFrom(primary: primaryColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: primaryColor.withOpacity(0.95),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          elevation: 0),
    ),
  );
}
