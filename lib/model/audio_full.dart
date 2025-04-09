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

  factory AudioFull.fromJson(Map<String, dynamic> json) =>
      _$AudioFullFromJson(json);

  Map<String, dynamic> toJson() => _$AudioFullToJson(this);
}
