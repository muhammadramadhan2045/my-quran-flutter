import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/model/audio_full.dart';
import 'package:my_quran/model/ayat.dart';
import 'package:my_quran/model/surat_selanjutnya.dart';

part 'data_surah.g.dart';

@JsonSerializable()
class DataSurah {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  AudioFull? audioFull;
  List<Ayat>? ayat;
  SuratSelanjutnya? suratSelanjutnya;
  SuratSelanjutnya? suratSebelumnya;

  DataSurah({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory DataSurah.fromJson(Map<String, dynamic> json) =>
      _$DataSurahFromJson(json);

  Map<String, dynamic> toJson() => _$DataSurahToJson(this);
}
