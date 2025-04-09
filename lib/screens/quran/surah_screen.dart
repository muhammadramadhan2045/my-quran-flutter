import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/providers/surah_provider.dart';
import 'package:my_quran/routes/app_routes.dart';

class SurahScreen extends ConsumerWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahState = ref.watch(surahProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah'),
      ),
      body: surahState.when(
        data: (surah) {
          return ListView.builder(
            itemCount: surah.data?.length ?? 0,
            padding: const EdgeInsets.all(8),
            clipBehavior: Clip.antiAlias,
            itemBuilder: (context, index) {
              final data = surah.data?[index];
              return ListTile(
                title: Text(
                  data?.namaLatin ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(data?.arti ?? ''),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.detailSurah,
                    arguments: {
                      'id': data?.nomor,
                    },
                  );
                },
              );
            },
          );
        },
        error: (error, stacktrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Error'),
                Text(error.toString()),
                ElevatedButton(
                  onPressed: () {
                    ref.read(surahProvider.notifier).fetchSurahs();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
