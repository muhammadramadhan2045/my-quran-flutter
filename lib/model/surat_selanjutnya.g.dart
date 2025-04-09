// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surat_selanjutnya.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuratSelanjutnya _$SuratSelanjutnyaFromJson(Map<String, dynamic> json) =>
    SuratSelanjutnya(
      nomor: (json['nomor'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      namaLatin: json['namaLatin'] as String?,
      jumlahAyat: (json['jumlahAyat'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SuratSelanjutnyaToJson(SuratSelanjutnya instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
    };
