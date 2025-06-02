import 'package:json_annotation/json_annotation.dart';
part 'audio_full.g.dart';

@JsonSerializable()
class AudioFull {
  @JsonKey(name: '01')
  String? s01;
  @JsonKey(name: '02')
  String? s02;
  @JsonKey(name: '03')
  String? s03;
  @JsonKey(name: '04')
  String? s04;
  @JsonKey(name: '05')
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
