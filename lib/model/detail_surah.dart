import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/model/audio_full.dart';

part 'detail_surah.g.dart';

@JsonSerializable()
class DetailSurah {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  AudioFull? audioFull;

  DetailSurah({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
  });

  factory DetailSurah.fromJson(Map<String, dynamic> json) =>
      _$DetailSurahFromJson(json);

  Map<String, dynamic> toJson() => _$DetailSurahToJson(this);
}
