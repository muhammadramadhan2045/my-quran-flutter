// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ayat _$AyatFromJson(Map<String, dynamic> json) => Ayat(
      nomorAyat: (json['nomorAyat'] as num?)?.toInt(),
      teksArab: json['teksArab'] as String?,
      teksLatin: json['teksLatin'] as String?,
      teksIndonesia: json['teksIndonesia'] as String?,
      audio: json['audio'] == null
          ? null
          : AudioFull.fromJson(json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyatToJson(Ayat instance) => <String, dynamic>{
      'nomorAyat': instance.nomorAyat,
      'teksArab': instance.teksArab,
      'teksLatin': instance.teksLatin,
      'teksIndonesia': instance.teksIndonesia,
      'audio': instance.audio,
    };
