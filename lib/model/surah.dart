import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/model/data_surah.dart';

part 'surah.g.dart';

@JsonSerializable()
class Surah {
  int? code;
  String? message;
  List<DataSurah>? data;

  Surah({
    this.code,
    this.message,
    this.data,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);
}
