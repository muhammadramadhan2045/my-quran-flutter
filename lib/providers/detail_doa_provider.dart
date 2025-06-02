import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/api/api_service.dart';
import 'package:my_quran/common/constants/url.dart';
import 'package:my_quran/common/utils/string_utils.dart';
import 'package:my_quran/model/doa.dart';

class DetailDoaNotifier extends StateNotifier<AsyncValue<Doa>> {
  DetailDoaNotifier(String id) : super(const AsyncValue.loading()) {
    fetchDoa(id);
  }

  Future<void> fetchDoa(String id) async {
    try {
      state = const AsyncValue.loading();
      String nameDoa = StringUtils.deleteKarakter(id, "Doa");
      final dynamicData =
          await ApiService(baseUrl: doaDetailUrl).getDataById(nameDoa);

      Doa doa = Doa.fromJson(dynamicData);

      state = AsyncValue.data(doa);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final doaIdProvider =
    StateNotifierProvider.family<DetailDoaNotifier, AsyncValue<Doa>, String>(
  (ref, id) => DetailDoaNotifier(id),
);
