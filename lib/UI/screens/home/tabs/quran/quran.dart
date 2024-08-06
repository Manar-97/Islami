import 'package:flutter/material.dart';
import 'package:islami/UI/providers/theme_provider.dart';
import 'package:islami/UI/utils/app_assets.dart';
import 'package:islami/UI/utils/app_colors.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:islami/model/sura_details_argu.dart';
import 'package:provider/provider.dart';
import '../../../../utils/sureconsts.dart';
import '../../../sura_details/sura_details.dart';

class Quran extends StatelessWidget {
   Quran({super.key});

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildHeaderImage(),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  buildDivider(),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        context.local.versesnumber,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontFamily: "ElMessiri",fontSize: 25,fontWeight:FontWeight.w600),
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        context.local.suraname,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontFamily: "ElMessiri",fontSize: 25,fontWeight:FontWeight.w600),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                  buildDivider(),
                  buildSuraList(),
                ],
              ),
               VerticalDivider(
                  thickness: 3, color: themeProvider.isDarkThemeEnabled ? AppColors.accentDarkColor : AppColors.primaryColor, indent: 7),
            ],
          ),
        ),
      ],
    );
  }

  Expanded buildSuraList() {
    return Expanded(
      child: ListView.builder(
          itemCount: Constant.sure.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, SuraDetails.routName,
                    arguments: SuraDetailsArgs(
                        suraName: Constant.sure[index],
                        fileName: '${index + 1}.txt'));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Text(
                    Constant.versesNumber[index].toString(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20,fontFamily: 'Inter',fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                    child: Text(
                      Constant.sure[index],
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 22,fontFamily: 'Inter',fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Divider buildDivider() =>
      Divider(color: themeProvider.isDarkThemeEnabled ? AppColors.accentDarkColor : AppColors.primaryColor, thickness: 3);

  Expanded buildHeaderImage() {
    return Expanded(
      flex: 3,
      child: Center(child: Image.asset(AppAssets.logoQuran)),
    );
  }
}
