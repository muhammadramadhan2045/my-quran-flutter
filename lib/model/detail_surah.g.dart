// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurah _$DetailSurahFromJson(Map<String, dynamic> json) => DetailSurah(
      nomor: (json['nomor'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      namaLatin: json['namaLatin'] as String?,
      jumlahAyat: (json['jumlahAyat'] as num?)?.toInt(),
      tempatTurun: json['tempatTurun'] as String?,
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      audioFull: json['audioFull'] == null
          ? null
          : AudioFull.fromJson(json['audioFull'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailSurahToJson(DetailSurah instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audioFull': instance.audioFull,
    };
