import 'package:flutter/material.dart';
import 'package:islami/UI/utils/app_assets.dart';

import '../home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String routName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, Home.routName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.splash),
    );
  }
}
