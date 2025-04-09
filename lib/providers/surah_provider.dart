import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/api/api_service.dart';
import 'package:my_quran/common/constants/url.dart';
import 'package:my_quran/model/surah.dart';

class SurahNotifier extends StateNotifier<AsyncValue<Surah>> {
  SurahNotifier() : super(const AsyncValue.loading()) {
    fetchSurahs();
  }

  Future<void> fetchSurahs() async {
    try {
      state = const AsyncValue.loading();
      final dynamicData = await ApiService(baseUrl: surahUrl).getData();

      Surah surah = Surah.fromJson(dynamicData);
      state = AsyncValue.data(surah);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final surahProvider = StateNotifierProvider<SurahNotifier, AsyncValue<Surah>>(
  (ref) => SurahNotifier(),
);
