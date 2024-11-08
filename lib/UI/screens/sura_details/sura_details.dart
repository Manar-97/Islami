import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/UI/widgets/app_scaffold.dart';
import 'package:islami/model/sura_details_argu.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String routName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;
  late MyProvider myProvider;
  String fileContent = '';

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return AppScaffold(
      body: fileContent.isEmpty ? buildLoading() : buildSuraContent(),
    );
  }
  Widget buildLoading() {
    return Center(
        child: CircularProgressIndicator(
      color: Theme.of(context).colorScheme.background,
    ));
  }

  Widget buildSuraContent() {
    myProvider = Provider.of(context);
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
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
                      args.suraName,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle,
                          size: 33,
                        ),
                        color:Theme.of(context).bottomNavigationBarTheme.selectedItemColor)
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Divider(
                      color: Theme.of(context).colorScheme.background,
                      thickness: 2),
                ),
                Text(
                  fileContent,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future readFile() async {
    fileContent = await rootBundle.loadString("assets/quran/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "(${i + 1})";
    }
    fileContent = fileLines.join();
    setState(() {});
    print("File Content = $fileContent");
  }
}
