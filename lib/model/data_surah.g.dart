// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_surah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSurah _$DataSurahFromJson(Map<String, dynamic> json) => DataSurah(
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
      ayat: (json['ayat'] as List<dynamic>?)
          ?.map((e) => Ayat.fromJson(e as Map<String, dynamic>))
          .toList(),
      suratSelanjutnya:
          json['suratSelanjutnya'] == null || json['suratSelanjutnya'] == false
              ? null
              : SuratSelanjutnya.fromJson(
                  json['suratSelanjutnya'] as Map<String, dynamic>),
      suratSebelumnya:
          json['suratSebelumnya'] == null || json['suratSebelumnya'] == false
              ? null
              : SuratSelanjutnya.fromJson(
                  json['suratSebelumnya'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataSurahToJson(DataSurah instance) => <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audioFull': instance.audioFull,
      'ayat': instance.ayat,
      'suratSelanjutnya': instance.suratSelanjutnya,
      'suratSebelumnya': instance.suratSebelumnya,
    };
