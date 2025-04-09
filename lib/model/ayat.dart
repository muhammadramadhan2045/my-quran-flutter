import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/model/audio_full.dart';

part 'ayat.g.dart';

@JsonSerializable()
class Ayat {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  AudioFull? audio;

  Ayat(
      {this.nomorAyat,
      this.teksArab,
      this.teksLatin,
      this.teksIndonesia,
      this.audio});

  factory Ayat.fromJson(Map<String, dynamic> json) => _$AyatFromJson(json);

  Map<String, dynamic> toJson() => _$AyatToJson(this);
}
