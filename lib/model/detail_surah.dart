import 'package:my_quran/model/data_surah.dart';

part 'detail_surah.g.dart';

class DetailSurah {
  int? code;
  String? message;
  DataSurah? data;

  DetailSurah({
    this.code,
    this.message,
    this.data,
  });

  factory DetailSurah.fromJson(Map<String, dynamic> json) =>
      _$DetailSurahFromJson(json);
  Map<String, dynamic> toJson() => _$DetailSurahToJson(this);
}
