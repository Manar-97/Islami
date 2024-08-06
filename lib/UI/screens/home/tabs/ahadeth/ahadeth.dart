import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/UI/providers/theme_provider.dart';
import 'package:islami/UI/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';
import '../../../../../model/hadeth.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class Ahadeth extends StatefulWidget {
  Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadeth> hadethList = [];

  @override
  void initState() {
    readHadethFile();
    super.initState();
  }

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
                            context.local.hadethnumber,
                        style:Theme.of(context).textTheme.displayLarge?.copyWith(fontFamily: "ElMessiri",fontSize: 25,fontWeight:FontWeight.w600),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  buildDivider(),
                  buildAhadethList(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future readHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString("assets/hadeth/ahadeth.txt");
    List<String> ahadethAsString = ahadethContent.split("#\r\n");
    for (int i = 0; i < ahadethAsString.length; i++) {
      String hadeth = ahadethAsString[i];
      List<String> hadethLines = hadeth.split("\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join();
      hadethList.add(Hadeth( hadethContent:hadethContent, hadethTitle: hadethName.trim()));
    }
    setState(() {});
  }

  Widget buildAhadethList() {
    return Expanded(
        child: hadethList.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: hadethList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,HadethDetails.routName,arguments:hadethList[index] );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            hadethList[index].hadethTitle,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 22,fontFamily: 'Inter',fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                }));
  }

  Divider buildDivider() =>
      Divider(color: themeProvider.isDarkThemeEnabled ? AppColors.accentDarkColor : AppColors.primaryColor, thickness: 3);

  Expanded buildHeaderImage() {
    return Expanded(
      flex: 3,
      child: Center(child: Image.asset(AppAssets.logoHadeth)),
    );
  }
}
