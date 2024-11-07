import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../home/home.dart';

class Splash extends StatefulWidget {
   const Splash({super.key});
  static const String routName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late MyProvider myProvider;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, Home.routName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(myProvider.splash)),
        ),
      ),
    );
  }
}
