import 'package:flutter/material.dart';
import 'package:islami/UI/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_assets.dart';

enum ThemeOptions { lightTheme, darkTheme }

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkThemeEnabled => themeMode == ThemeMode.dark;

  void toggleTheme(ThemeOptions themeOption) {
    switch (themeOption) {
      case ThemeOptions.lightTheme:
        themeMode = ThemeMode.light;
        break;
      case ThemeOptions.darkTheme:
        themeMode = ThemeMode.dark;
        break;
    }
    saveThemeMode();
    loadThemeMode();
    notifyListeners();
  }

  Future<void> saveThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("themeMode", themeMode.toString());
    var res = pref.getString("themeMode");
    print(res);
  }

  Future<void> loadThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final savedTheme = await pref.getString("themeMode");
    if (savedTheme != null) {
      themeMode = ThemeMode.values
          .firstWhere((element) => element.toString() == savedTheme);
    }
    notifyListeners();
  }

  set newTheme(ThemeMode themeMode) {
    themeMode = themeMode;
    notifyListeners();
  }

  String get mainBackground =>
      isDarkThemeEnabled ? AppAssets.backgroundDark : AppAssets.background;

  Color get getPrimaryColor =>
      isDarkThemeEnabled ? AppColors.primaryDarkColor : AppColors.primaryColor;

  Color get getLangColor => isDarkThemeEnabled ? Colors.white : Colors.black;
}
