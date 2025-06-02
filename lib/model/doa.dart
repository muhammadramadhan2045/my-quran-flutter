import 'package:json_annotation/json_annotation.dart';

part 'doa.g.dart';

@JsonSerializable()
class Doa {
  String? id;
  String? doa;
  String? ayat;
  String? latin;
  String? artinya;

  Doa({this.id, this.doa, this.ayat, this.latin, this.artinya});

  factory Doa.fromJson(Map<String, dynamic> json) => _$DoaFromJson(json);
  Map<String, dynamic> toJson() => _$DoaToJson(this);
}
