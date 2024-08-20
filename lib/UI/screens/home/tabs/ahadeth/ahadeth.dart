import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/UI/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/UI/utils/extentions/build_context_extentions.dart';
import 'package:provider/provider.dart';
import '../../../../../model/hadeth.dart';
import '../../../../providers/my_provider.dart';
import '../../../../utils/app_assets.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

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
                            context.local.hadethnumber,
                        style:Theme.of(context).textTheme.headlineMedium,
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
            ? const CircularProgressIndicator()
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
                            style: Theme.of(context).textTheme.labelLarge,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                }));
  }

  Divider buildDivider() =>
      Divider(color: Theme.of(context).colorScheme.background, thickness: 3);

  Expanded buildHeaderImage() {
    return Expanded(
      flex: 3,
      child: Center(child: Image.asset(AppAssets.logoHadeth)),
    );
  }
}
