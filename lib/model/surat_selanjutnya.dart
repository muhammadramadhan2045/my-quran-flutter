import 'package:json_annotation/json_annotation.dart';
part 'surat_selanjutnya.g.dart';

@JsonSerializable()
class SuratSelanjutnya {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  SuratSelanjutnya({this.nomor, this.nama, this.namaLatin, this.jumlahAyat});

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) => _$SuratSelanjutnyaFromJson(json);

  Map<String, dynamic> toJson() => _$SuratSelanjutnyaToJson(this);
}
