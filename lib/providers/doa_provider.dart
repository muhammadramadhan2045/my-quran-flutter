import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/api/api_service.dart';
import 'package:my_quran/common/constants/url.dart';
import 'package:my_quran/model/doa.dart';

class DoaNotifier extends StateNotifier<AsyncValue<List<Doa>>> {
  DoaNotifier() : super(const AsyncValue.loading()) {
    fetchDoas();
  }

  Future<void> fetchDoas() async {
    try {
      state = const AsyncValue.loading();
      final dynamicData = await ApiService(baseUrl: doaUrl).getListData(null);

      List<Doa> doas = (dynamicData)
          .map((doa) => Doa.fromJson(doa as Map<String, dynamic>))
          .toList();

      state = AsyncValue.data(doas);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final doaProvider = StateNotifierProvider<DoaNotifier, AsyncValue<List<Doa>>>(
  (ref) => DoaNotifier(),
);
