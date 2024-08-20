// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyProvider with ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.system;
//   String language = 'ar';
//   late SharedPreferences prefs;
//
//   changeTheme(ThemeMode theme) {
//     themeMode = theme;
//     setThemeToCash(theme);
//     notifyListeners();
//   }
//
//   changeLanguage(String lang) {
//     language = lang;
//     setLanguageToCash(lang);
//     notifyListeners();
//   }
//
//   Future setThemeToCash(ThemeMode theme) async {
//     prefs = await SharedPreferences.getInstance();
//     String themeName = theme == ThemeMode.light ? "Light" : "Dark";
//     await prefs.setString("themeMode", themeName);
//   }
//
//   saveTheme() async {
//     prefs = await SharedPreferences.getInstance();
//     final String? themeName = prefs.getString("themeMode");
//     if (themeName != null) {
//       themeMode = themeName == "Light" ? ThemeMode.light : ThemeMode.dark;
//       notifyListeners();
//     }
//   }
//
//   Future setLanguageToCash(String lang) async {
//     prefs = await SharedPreferences.getInstance();
//     String language = lang == ThemeMode.light ? "Light" : "Dark";
//     await prefs.setString("language", language);
//   }
//
//   // void _saveLanguage(bool isArabic){
//   //   prefs.setBool("isArabic",isArabic);
//   // }
//   //
//   // void _saveTheme(bool isDark){
//   //   prefs.setBool("isDark",isDark);
//   // }
// }
