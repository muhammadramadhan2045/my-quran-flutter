// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sholat_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SholatSchedule _$SholatScheduleFromJson(Map<String, dynamic> json) =>
    SholatSchedule(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : DataSholat.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SholatScheduleToJson(SholatSchedule instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataSholat _$DataSholatFromJson(Map<String, dynamic> json) => DataSholat(
      id: (json['id'] as num?)?.toInt(),
      lokasi: json['lokasi'] as String?,
      daerah: json['daerah'] as String?,
      jadwal: json['jadwal'] == null
          ? null
          : Jadwal.fromJson(json['jadwal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataSholatToJson(DataSholat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lokasi': instance.lokasi,
      'daerah': instance.daerah,
      'jadwal': instance.jadwal,
    };

Jadwal _$JadwalFromJson(Map<String, dynamic> json) => Jadwal(
      tanggal: json['tanggal'] as String?,
      imsak: json['imsak'] as String?,
      subuh: json['subuh'] as String?,
      terbit: json['terbit'] as String?,
      dhuha: json['dhuha'] as String?,
      dzuhur: json['dzuhur'] as String?,
      ashar: json['ashar'] as String?,
      maghrib: json['maghrib'] as String?,
      isya: json['isya'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$JadwalToJson(Jadwal instance) => <String, dynamic>{
      'tanggal': instance.tanggal,
      'imsak': instance.imsak,
      'subuh': instance.subuh,
      'terbit': instance.terbit,
      'dhuha': instance.dhuha,
      'dzuhur': instance.dzuhur,
      'ashar': instance.ashar,
      'maghrib': instance.maghrib,
      'isya': instance.isya,
      'date': instance.date,
    };
