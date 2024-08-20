import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/UI/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/screens/hadeth_details/hadeth_details.dart';
import 'UI/screens/home/home.dart';
import 'UI/screens/splash/splash.dart';
import 'UI/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'UI/utils/app_Themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => MyProvider(
              pref.getBool('isDark'), pref.getBool('isEnglish') ?? true))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: Provider.of<MyProvider>(context).mode,
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
      locale: Locale(Provider.of<MyProvider>(context).local),
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routName: (_) => const Splash(),
        Home.routName: (_) => Home(),
        SuraDetails.routName: (_) => SuraDetails(),
        HadethDetails.routName: (_) => HadethDetails(),
      },
      initialRoute: Splash.routName,
    );
  }
}
