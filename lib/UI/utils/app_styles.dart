import 'package:flutter/material.dart';
import 'package:islami/UI/utils/app_colors.dart';

abstract class AppStyles {
  static const TextStyle appBarTextStyle = TextStyle(
      color: AppColors.accentColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: 'ElMessiri');
  static const TextStyle mainTitleTextStyle = TextStyle(
      color: AppColors.accentColor,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontFamily: 'ElMessiri');
  static const TextStyle titleTextStyle = TextStyle(
      color: AppColors.accentColor,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter');

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparentColor,
        titleTextStyle: appBarTextStyle,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        displayLarge: mainTitleTextStyle,
        displayMedium: titleTextStyle
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentColor,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
      primaryColor: AppColors.primaryDarkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparentColor,
        titleTextStyle: appBarTextStyle.copyWith(color: AppColors.whiteColor),
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: mainTitleTextStyle.copyWith(color: AppColors.whiteColor),
        displayMedium: titleTextStyle.copyWith(color: AppColors.whiteColor)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentDarkColor,
      ));
}
