import 'package:json_annotation/json_annotation.dart';
part 'audio_full.g.dart';

@JsonSerializable()
class AudioFull {
  String? s01;
  String? s02;
  String? s03;
  String? s04;
  String? s05;

  AudioFull({
    this.s01,
    this.s02,
    this.s03,
    this.s04,
    this.s05,
  });

  AudioFull.fromJson(Map<String, dynamic> json) {
    s01 = json['01'];
    s02 = json['02'];
    s03 = json['03'];
    s04 = json['04'];
    s05 = json['05'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['01'] = s01;
    data['02'] = s02;
    data['03'] = s03;
    data['04'] = s04;
    data['05'] = s05;
    return data;
  }
}
