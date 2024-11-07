import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../../../model/radio_Item.dart';
import '../../../../../model/radio_response.dart';
import '../../../../shared_widget/quran_radio_item.dart';
import '../../../../utils/app_assets.dart';
import 'package:http/http.dart' as http;

class MyRadio extends StatelessWidget {
  MyRadio({super.key});
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRadio(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong Please Try Again!'),
            );
          }
          List<Radios> radios = snapshot.data as List<Radios>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              Image.asset(AppAssets.radio),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: QuranRadioItem(
                        radioItem: radios,
                        audioPlayer: audioPlayer,
                        initialIndex: index,
                      )),
                  itemCount: radios.length,
                ),
              ),
              const Spacer(),
            ],
          );
        });
  }
}

Future<List<Radios>> getRadio() async {
  try {
    Uri url = Uri.parse('https://mp3quran.net/api/v3/radios');
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    RadioResponse radioResponse = RadioResponse.fromJson(json);
    return radioResponse.radios ?? [];
  } catch (e) {
    print(e.toString());
  }
  return [];
}
