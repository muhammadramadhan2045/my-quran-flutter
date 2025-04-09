// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurah _$DetailSurahFromJson(Map<String, dynamic> json) => DetailSurah(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataSurah.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailSurahToJson(DetailSurah instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
