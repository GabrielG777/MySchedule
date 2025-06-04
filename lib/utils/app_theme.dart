import 'package:flutter/material.dart';

class AppColors {
  // Cores base
  static const Color lightPrimary = Color.fromARGB(255, 20, 78, 51);
  static const Color lightSecondary = Color.fromARGB(255, 18, 97, 18);
  static const Color lightAccent = Color.fromARGB(255, 2, 51, 10);
  static const Color lightBackground = Colors.white;
  static const Color lightText = Colors.black;

  static const Color darkPrimary = Color.fromARGB(255, 2, 51, 10);
  static const Color darkSecondary = Color.fromARGB(255, 18, 97, 18);
  static const Color darkAccent = Color.fromARGB(255, 20, 78, 51);
  static const Color darkBackground = Color.fromARGB(255, 10, 25, 15);
  static const Color darkText = Colors.white;
}

class AppTheme {
  // Claro
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: AppColors.lightText,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(color: AppColors.lightText),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightBackground,
    ),
    iconTheme: const IconThemeData(color: AppColors.lightPrimary),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightSecondary,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightSecondary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // Escuro
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkText,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(color: AppColors.darkText),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkBackground,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkAccent),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkSecondary,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkSecondary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
