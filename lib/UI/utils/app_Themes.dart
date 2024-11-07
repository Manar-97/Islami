import 'package:flutter/material.dart';

class Themes{

  static ThemeData darkTheme = ThemeData(
      cardTheme: CardTheme(
        color: const Color(0xFF141A2E),
        shadowColor: const Color(0xFF141A2E),
        margin:
        const EdgeInsets.only(top: 30, bottom: 100, right: 20, left: 20),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontFamily: 'ElMessiri-SemiBold',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'ElMessiri-SemiBold',
            fontWeight: FontWeight.w600),
        labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'ElMessiri-SemiBold',
            fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'ElMessiri-SemiBold',
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: '',
            fontSize: 25,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: Colors.white,
            fontFamily: '',
            fontSize: 20,
            fontWeight: FontWeight.normal),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(size: 30),
          selectedIconTheme: IconThemeData(size: 35, color: Color(0xFFcb9f17)),
          selectedItemColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF141A2E),
        primary: const Color(0xFF141A2E),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: const Color(0xFFcb9f17),
        onSecondary: const Color(0xFF000000),
        background: const Color(0xFFcb9f17),
      ),
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF141A2E),
      ));

  static ThemeData lightTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(top: 30, bottom: 100, right: 20, left: 20),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontFamily: 'ElMessiri-SemiBold',
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold)),
    colorScheme: ColorScheme.fromSeed(
      background: const Color(0xFFB7935F),
      seedColor: const Color(0xFFB7935F),
      primary: const Color(0xFFB7935F),
      onPrimary: const Color(0xFF000000),
      secondary: const Color(0xFF000000),
      onSecondary: const Color(0xFFFFFFFF),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'ElMessiri-SemiBold',
          fontWeight: FontWeight.w600),
      labelLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'ElMessiri-SemiBold',
          fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'ElMessiri-SemiBold',
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontFamily: '',
          fontSize: 25,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: Colors.black,
          fontFamily: '',
          fontSize: 20,
          fontWeight: FontWeight.normal),
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(size: 30),
        selectedIconTheme: IconThemeData(size: 35, color: Colors.black),
        selectedItemColor: Colors.black),
  );

}