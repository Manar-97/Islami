import 'package:flutter/material.dart';
import 'package:islami/UI/providers/theme_provider.dart';
import '../utils/app_assets.dart';
import 'language_provider.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  String theme = 'light';
  ThemeSharedPreference themePref = ThemeSharedPreference();
  String local = 'en';
  String lang = "English";
  LangSharedPreference langPref = LangSharedPreference();

  MyProvider(bool? isDark, bool? isEnglish) {
    setInitial(isDark, isEnglish);
  }

  void changeThemes(ThemeMode themeMode) {
    if (themeMode == mode) {
      return;
    }
    mode = themeMode;
    if (mode == ThemeMode.dark) {
      themePref.setTheme(true);
      theme = 'dark';
    } else {
      themePref.setTheme(false);
      theme = 'light';
    }
    notifyListeners();
  }

  void setInitial(bool? isDark, bool? isEnglish) {
    if (isDark == true) {
      mode = ThemeMode.dark;
      theme = 'dark';
    } else {
      mode = ThemeMode.light;
      theme = 'light';
    }
    if (isEnglish == true) {
      local = 'en';
      lang = "English";
    } else {
      local = 'ar';
      lang = "Arabic";
    }
  }

  bool isDark() {
    return mode == ThemeMode.dark;
  }

  void changeLang(String? val) {
    if (val == lang) {
      return;
    }
    lang = val ?? "English";
    if (lang == "English") {
      local = 'en';
      langPref.setLang(true);
    } else {
      local = 'ar';
      langPref.setLang(false);
    }
    notifyListeners();
  }

  String get mainBackground =>
      mode == ThemeMode.dark ? AppAssets.backgroundDark : AppAssets.background;

   String get splash =>
       mode == ThemeMode.dark ? AppAssets.splashdark : AppAssets.splash;
}
