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
}
