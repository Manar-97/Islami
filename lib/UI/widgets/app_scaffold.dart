import 'package:flutter/material.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';
import '../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({super.key, this.body, this.bottonNavigation});

  final Widget? body;
  final Widget? bottonNavigation;
  late MyProvider myemeProvider;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(myProvider.mainBackground))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.local.islami),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
        ),
        bottomNavigationBar: bottonNavigation,
        body: body,
      ),
    );
  }
}
