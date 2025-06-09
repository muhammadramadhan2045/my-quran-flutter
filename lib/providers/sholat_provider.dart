import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/api/api_service.dart';
import 'package:my_quran/common/constants/url.dart';
import 'package:my_quran/model/sholat_schedule.dart';

class SholatNotifier extends StateNotifier<AsyncValue<SholatSchedule>> {
  SholatNotifier() : super(const AsyncValue.loading()) {
    fetchSholat();
  }

  Future<void> fetchSholat() async {
    try {
      state = const AsyncValue.loading();
      final dynamicData =
          await ApiService(baseUrl: "$sholatScheduleUrl/1807/2025/06/09")
              .getData(null);

      SholatSchedule sholat = SholatSchedule.fromJson(dynamicData);
      state = AsyncValue.data(sholat);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final sholatProvider =
    StateNotifierProvider<SholatNotifier, AsyncValue<SholatSchedule>>(
  (ref) => SholatNotifier(),
);
