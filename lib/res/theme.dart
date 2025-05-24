import 'package:flutter/material.dart';
import 'colors.dart';

class BonfireTheme {
  static ThemeData get lightMode => ThemeData(
        primaryColor: BonfireColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: BonfireColors.primaryColor,
          primary: BonfireColors.primaryColor,
        ),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      );
}
