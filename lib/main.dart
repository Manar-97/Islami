import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/UI/providers/language_provider.dart';
import 'package:islami/UI/providers/theme_provider.dart';
import 'package:islami/UI/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'UI/screens/hadeth_details/hadeth_details.dart';
import 'UI/screens/home/home.dart';
import 'UI/screens/splash/splash.dart';
import 'UI/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ChangeNotifierProvider(
    create: (_) => ThemeProvider()..toggleTheme(),
    child: ChangeNotifierProvider(
      create:(_) => LanguageProvider()..getLanguage(),
        child:const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);

    return MaterialApp(
      theme: themeProvider.isDarkThemeEnabled ? AppStyles.lightTheme : AppStyles.lightTheme,
      // darkTheme: AppStyles.darkTheme,
      // themeMode: themeProvider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: languageProvider.locale,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routName : (_) => const Splash(),
        Home.routName : (_) => Home(),
        SuraDetails.routName : (_) => SuraDetails(),
        HadethDetails.routName : (_) => HadethDetails(),
      },
      initialRoute: Splash.routName,
    );
  }
}
