import 'package:flutter/material.dart';
import 'package:islami/UI/providers/theme_provider.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({super.key, this.body, this.bottonNavigation});

  final Widget? body;
  final Widget? bottonNavigation;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeProvider.mainBackground))),
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
