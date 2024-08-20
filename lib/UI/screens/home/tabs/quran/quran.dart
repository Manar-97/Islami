import 'package:flutter/material.dart';
import 'package:islami/UI/utils/app_assets.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:islami/model/sura_details_argu.dart';
import 'package:provider/provider.dart';
import '../../../../providers/my_provider.dart';
import '../../../../utils/sureconsts.dart';
import '../../../sura_details/sura_details.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  late MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of(context);
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
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        context.local.suraname,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                  buildDivider(),
                  buildSuraList(),
                ],
              ),
              VerticalDivider(
                  thickness: 3,
                  color: Theme.of(context).colorScheme.background,
                  indent: 7),
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
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                    child: Text(
                      Constant.sure[index],
                      style: Theme.of(context).textTheme.bodyMedium,
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
      Divider(color: Theme.of(context).colorScheme.background, thickness: 3);

  Expanded buildHeaderImage() {
    return Expanded(
      flex: 3,
      child: Center(child: Image.asset(AppAssets.logoQuran)),
    );
  }
}
