import 'package:flutter/material.dart';
import 'package:islami/UI/screens/home/tabs/settings/theme_bottom_sheet.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';

import '../../../../providers/my_provider.dart';
import 'language_bottom_sheet.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    String? selectedLang = Provider.of<MyProvider>(context).lang;
    String? selectedTheme = Provider.of<MyProvider>(context).theme;

    List<DropdownMenuItem<String>> dropDownItemsLang = [
      DropdownMenuItem(
        value: 'English',
        child: Text(
          context.local.en,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      DropdownMenuItem(
        value: 'Arabic',
        child: Text(
          context.local.ar,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ];
    List<DropdownMenuItem<String>> dropDownItemsThemes = [
      DropdownMenuItem(
        value: 'light',
        child: Text(
          context.local.light,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      DropdownMenuItem(
        value: 'dark',
        child: Text(
          context.local.dark,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ];

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                context.local.settings,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              Text(
                context.local.theme,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.background)),
                child: DropdownButton(
                  items: dropDownItemsThemes,
                  underline: Container(),
                  dropdownColor: Theme.of(context).colorScheme.background,
                  iconEnabledColor: Theme.of(context).cardColor,
                  value: selectedTheme,
                  onChanged: (select) {
                    var settingProvider =
                        Provider.of<MyProvider>(context, listen: false);
                    if (select == 'light') {
                      settingProvider.changeThemes(ThemeMode.light);
                    } else {
                      settingProvider.changeThemes(ThemeMode.dark);
                    }
                    ;
                  },
                  isExpanded: true,
                ),
              ),
              const Spacer(),
              Text(
                context.local.language,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.background)),
                child: DropdownButton(
                  items: dropDownItemsLang,
                  underline: Container(),
                  dropdownColor: Theme.of(context).colorScheme.background,
                  iconEnabledColor: Theme.of(context).cardColor,
                  value: selectedLang,
                  onChanged: (select) {
                    var settingProvider =
                        Provider.of<MyProvider>(context, listen: false);
                    settingProvider.changeLang(select);
                  },
                  isExpanded: true,
                ),
              ),
              const Spacer(flex: 8),
            ],
          ),
        ),
      ),
    );
  }

  void showThemeButtomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const ThemeBottomSheet());
  }

  void showLangButtomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const LanguageBottomSheet());
  }
}
