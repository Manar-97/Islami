import 'package:flutter/material.dart';
import 'package:islami/UI/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islami/UI/screens/home/tabs/quran/quran.dart';
import 'package:islami/UI/screens/home/tabs/sebha/sabha.dart';
import 'package:islami/UI/utils/app_Themes.dart';
import 'package:islami/UI/utils/app_assets.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:islami/UI/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import 'tabs/radio/radio.dart';
import 'tabs/settings/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  Widget currentTab = const Quran();
  List<Widget> tabs = [
    const Quran(),
    const Ahadeth(),
    Sebha(),
    const MyRadio(),
    const Settings(),
  ];
  late MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
    return AppScaffold(
      body: tabs[selectedTabIndex],
      bottonNavigation: buildBottomNavigation(),
    );
  }

  Theme buildBottomNavigation() {
    return Theme(
        data: myProvider.mode == ThemeMode.dark
        ? Themes.darkTheme
        : Themes.lightTheme,
        child: BottomNavigationBar(
            currentIndex: selectedTabIndex,
            onTap: (index) {
              selectedTabIndex = index;
              if (selectedTabIndex == 0) {
                currentTab = const Quran();
              } else if (selectedTabIndex == 1) {
                currentTab = const Ahadeth();
              } else if (selectedTabIndex == 2) {
                currentTab = Sebha();
              } else if (selectedTabIndex == 2) {
                currentTab = const MyRadio();
              }else{
                currentTab =const Settings();
              }
              setState(() {});
            },
            selectedIconTheme: const IconThemeData(size: 36),
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icQuran)),
                  label: context.local.quran),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icHadeth)),
                  label: context.local.ahadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icSebha)),
                  label: context.local.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icRadio)),
                  label: context.local.radio),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: context.local.settings),
            ]));
  }
}
