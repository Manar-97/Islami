import 'package:flutter/material.dart';
import 'package:islami/UI/providers/my_provider.dart';
import 'package:islami/UI/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';
import '../../../model/hadeth.dart';

class HadethDetails extends StatefulWidget {
  HadethDetails({super.key});

  static const String routName = 'hadeth_details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    myProvider = Provider.of(context);
    return AppScaffold(
      body: buildHadethContent(hadeth.hadethContent, hadeth.hadethTitle),
    );
  }

  Widget buildHadethContent(String content, String title) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).cardTheme.color,),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Divider(
                      color: Theme.of(context).colorScheme.background,
                      thickness: 2),
                ),
                Text(
                  content,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
