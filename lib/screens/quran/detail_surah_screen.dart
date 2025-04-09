import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_quran/providers/detail_surah_provider.dart';

class DetailSurahScreen extends ConsumerWidget {
  const DetailSurahScreen({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahIdState = ref.watch(
      surahIdProvider(id),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Surah'),
      ),
      body: surahIdState.when(data: (data) {
        return ListView.builder(
          itemCount: data.data?.ayat?.length ?? 0,
          itemBuilder: (context, index) {
            final ayat = data.data?.ayat?[index];
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (ayat?.nomorAyat != null) ...[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${ayat?.nomorAyat}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  Expanded(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ayat?.teksArab ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            ayat?.teksLatin ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        ayat?.teksIndonesia ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }, error: (error, stacktrace) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Error'),
              Text(error.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.read(surahIdProvider(id).notifier).fetchSurah(id);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
