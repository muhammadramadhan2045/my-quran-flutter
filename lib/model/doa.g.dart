// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doa _$DoaFromJson(Map<String, dynamic> json) => Doa(
      id: json['id'] as String?,
      doa: json['doa'] as String?,
      ayat: json['ayat'] as String?,
      latin: json['latin'] as String?,
      artinya: json['artinya'] as String?,
    );

Map<String, dynamic> _$DoaToJson(Doa instance) => <String, dynamic>{
      'id': instance.id,
      'doa': instance.doa,
      'ayat': instance.ayat,
      'latin': instance.latin,
      'artinya': instance.artinya,
    };
