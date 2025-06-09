import 'package:json_annotation/json_annotation.dart';
part 'sholat_schedule.g.dart';

@JsonSerializable()
class SholatSchedule {
  bool? status;
  DataSholat? data;

  SholatSchedule({this.status, this.data});

  factory SholatSchedule.fromJson(Map<String, dynamic> json) =>
      _$SholatScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$SholatScheduleToJson(this);
}

@JsonSerializable()
class DataSholat {
  int? id;
  String? lokasi;
  String? daerah;
  Jadwal? jadwal;

  DataSholat({this.id, this.lokasi, this.daerah, this.jadwal});

  factory DataSholat.fromJson(Map<String, dynamic> json) =>
      _$DataSholatFromJson(json);

  Map<String, dynamic> toJson() => _$DataSholatToJson(this);
}

@JsonSerializable()
class Jadwal {
  String? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  Jadwal(
      {this.tanggal,
      this.imsak,
      this.subuh,
      this.terbit,
      this.dhuha,
      this.dzuhur,
      this.ashar,
      this.maghrib,
      this.isya,
      this.date});

  factory Jadwal.fromJson(Map<String, dynamic> json) => _$JadwalFromJson(json);

  Map<String, dynamic> toJson() => _$JadwalToJson(this);
}
