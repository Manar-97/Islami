import 'package:islami/model/radio_Item.dart';

class RadioResponse {
  List<Radios>? radios;

  RadioResponse({this.radios});

  RadioResponse.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <Radios>[];
      json['radios'].forEach((v) {
        radios!.add(new Radios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.radios != null) {
      data['radios'] = this.radios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
