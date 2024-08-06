import 'package:flutter/material.dart';
import 'package:islami/UI/providers/language_provider.dart';
import 'package:islami/UI/utils/app_colors.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';
import '../../../../providers/theme_provider.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: themeProvider.isDarkThemeEnabled
                ? Color(0xFF141A2E)
                : Color(0xFFF8F8F8)),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(context.local.settings,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontFamily: "ElMessiri",
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 25),
              Text(context.local.language,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontFamily: "ElMessiri",
                      fontSize: 25,
                      fontWeight: FontWeight.w600)),
              buildLangMenu(),
              SizedBox(height: 20),
              buildThemeSwitch(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLangMenu() => DropdownButton(
        value: languageProvider.locale.languageCode,
        dropdownColor: themeProvider.isDarkThemeEnabled
            ? AppColors.primaryDarkColor
            : AppColors.primaryColor,
        focusColor:
            themeProvider.isDarkThemeEnabled ? Colors.white : Colors.black,
        style: TextStyle(
            color:
                themeProvider.isDarkThemeEnabled ? Colors.white : Colors.black),
        items: const [
          DropdownMenuItem<String>(
            value: "ar",
            child: Text(
              "العربية",
            ),
          ),
          DropdownMenuItem<String>(
            value: "en",
            child: Text(
              "English",
            ),
          )
        ],
        isExpanded: true,
        onChanged: (value) {
          languageProvider.setLocale(value!);
        },
      );

  Widget buildThemeSwitch() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.local.theme,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontFamily: "ElMessiri",
                  fontSize: 25,
                  fontWeight: FontWeight.w600)),
          Switch(
              value: themeProvider.isDarkThemeEnabled,
              activeColor: AppColors.accentDarkColor,
              onChanged: (newValue) {
                themeProvider.toggleTheme(
                    themeProvider.themeMode == ThemeMode.dark
                        ? ThemeOptions.lightTheme
                        : ThemeOptions.darkTheme);
                themeProvider.loadThemeMode();
                setState(() {});
              }),
        ],
      );
}
