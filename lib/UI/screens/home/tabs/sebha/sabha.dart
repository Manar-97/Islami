import 'package:flutter/material.dart';
import 'package:islami/UI/utils/app_assets.dart';
import 'package:islami/UI/utils/app_styles.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../providers/my_provider.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> with SingleTickerProviderStateMixin {
  int counter = 0;
  int currentZekrIndex = 0;
  double turns = 0.0;
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

  late MyProvider myProvider;
  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 62, top: 10),
              child: Image.asset(myProvider.mode == ThemeMode.dark
                  ? AppAssets.logoHeadSebhaDark
                  : AppAssets.logoHeadSebha)),
          AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: turns,
              child: Image.asset(myProvider.mode == ThemeMode.dark
                  ? AppAssets.logoBodySebhaDark
                  : AppAssets.logoBodySebha)),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              context.local.tsabehnum,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.background,
            ),
            height: 60,
            width: 60,
            child: Center(
                child: Text(
              '$counter',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ),
          const SizedBox(height: 20),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Theme.of(context).colorScheme.background,
              ),
              height: 60,
              width: 250,
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
    await prefs.setInt('counter', counter);
    await prefs.setInt('zekr', currentZekrIndex);
      setState(() {
        counter++;
        if (counter >= 33) {
          counter = 0;
          currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
        }
        // if (counter % 33 == 0) {
        //   currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
        // }
      });
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
