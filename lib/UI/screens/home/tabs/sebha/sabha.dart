import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/UI/providers/theme_provider.dart';
import 'package:islami/UI/utils/app_assets.dart';
import 'package:islami/UI/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_colors.dart';

class Sebha extends StatefulWidget {
  Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> with SingleTickerProviderStateMixin {
  int counter = 0;
  double turns = 0.0;
  int currentZekrIndex = 0;
  final List<String> azkar = [
    'أستغفر الله',
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'لا حول ولا قوة إلا بالله',
    'صل على محمد',
  ];
  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 62, top: 10),
              child: Image.asset(themeProvider.isDarkThemeEnabled
                  ? AppAssets.logoHeadSebhaDark
                  : AppAssets.logoHeadSebha)),
          AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: turns,
              child: Image.asset(themeProvider.isDarkThemeEnabled
                  ? AppAssets.logoBodySebhaDark
                  : AppAssets.logoBodySebha)),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              "عدد التسبيحات",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontFamily: "ElMessiri",
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.primaryDarkColor
                  : AppColors.primaryColor,
            ),
            height: 60,
            width: 60,
            child: Center(
                child: Text(
              '$counter',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 22,fontFamily: 'Inter',fontWeight: FontWeight.w400),
            )),
          ),
          const SizedBox(height: 20),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: themeProvider.isDarkThemeEnabled
                    ? AppColors.accentDarkColor
                    : AppColors.primaryColor,
              ),
              height: 55,
              width: 190,
              child: Center(
                  child: Text(
                azkar[currentZekrIndex],
                style: AppStyles.titleTextStyle.copyWith(color: Colors.white),
              )),
            ),
            onTap: () {
              setState(() {
                incrementCounter();
                sebhaRotate();
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      if (counter % 33 == 0) {
        currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
      }
    });
    await prefs.setInt('counter', counter);
    await prefs.setInt('zekr', currentZekrIndex);
  }

  void sebhaRotate() {
    setState(() {
      turns += 1 / 30;
    });
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
      currentZekrIndex = prefs.getInt('zekr') ?? 0;
    });
  }
}
