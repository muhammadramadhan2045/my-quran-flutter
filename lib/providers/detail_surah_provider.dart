import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/api/api_service.dart';
import 'package:my_quran/common/constants/url.dart';
import 'package:my_quran/model/ayat.dart';
import 'package:my_quran/model/detail_surah.dart';

class DetailSurahNotifier extends StateNotifier<AsyncValue<DetailSurah>> {
  DetailSurahNotifier(int id) : super(const AsyncValue.loading()) {
    fetchSurah(id);
  }

  Future<void> fetchSurah(int id) async {
    try {
      state = const AsyncValue.loading();
      final dynamicData = await ApiService(baseUrl: surahUrl).getDataById(id);

      DetailSurah surah = DetailSurah.fromJson(dynamicData);
      if (id != 1) {
        surah.data?.ayat?.insert(
          0,
          Ayat(
            teksArab: 'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ',
            teksLatin: 'Bismillahirrahmanirrahim',
            teksIndonesia:
                'Dengan nama Allah Yang Maha Pengasih, Maha Penyayang',
          ),
        );
      }
      state = AsyncValue.data(surah);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final surahIdProvider = StateNotifierProvider.family<DetailSurahNotifier,
    AsyncValue<DetailSurah>, int>(
  (ref, id) => DetailSurahNotifier(id),
);
