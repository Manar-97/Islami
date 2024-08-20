import 'package:flutter/material.dart';
import 'package:islami/UI/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_assets.dart';

class ThemeProvider with ChangeNotifier {
   bool _isDark = false;
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkThemeEnabled => _isDark;


  ThemeProvider() {
    _loadTheme();
  }

  void toggleTheme() async {
    _isDark = !_isDark;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', _isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }


  // void toggleTheme(bool isDark) {
  //   switch (isDark) {
  //     case true:
  //       themeMode = ThemeMode.dark;
  //       break;
  //     case false:
  //       themeMode = ThemeMode.light;
  //       break;
  //   }
  //   notifyListeners();
  // }

  // Future<void> changeTheme(ThemeMode theme) async {
  //   themeMode = theme;
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("isdark", themeMode == ThemeMode.dark);
  //   notifyListeners();
  // }
  //
  // Future<void> getTheme() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? isDark = prefs.getBool("isdark");
  //   switch (isDark) {
  //     case false:
  //       themeMode = ThemeMode.light;
  //       break;
  //     case true:
  //       themeMode = ThemeMode.dark;
  //       break;
  //     case null:
  //       // TODO: Handle this case.
  //       return;
  //   }
  //   notifyListeners();
  //   // if (isDark == null) {
  //   //   if (isDark == true) {
  //   //     themeMode = ThemeMode.dark;
  //   //   } else {
  //   //     themeMode = ThemeMode.light;
  //   //   }
  //   //   notifyListeners();
  //   // }
  // }

  // loadTheme() async {
  //   prefs = await SharedPreferences.getInstance();
  //   final String? themeName = prefs.getString("themeMode");
  //   if (themeName != null) {
  //     themeMode = themeName == "Light" ? ThemeMode.light : ThemeMode.dark;
  //     notifyListeners();
  //   }
  // }

  String get mainBackground =>
      isDarkThemeEnabled ? AppAssets.backgroundDark : AppAssets.background;

   String get splash =>
       isDarkThemeEnabled ? AppAssets.splashdark : AppAssets.splash;


   Color get getPrimaryColor =>
      isDarkThemeEnabled ? AppColors.primaryDarkColor : AppColors.primaryColor;

  Color get getLangColor => isDarkThemeEnabled ? Colors.white : Colors.black;
}
