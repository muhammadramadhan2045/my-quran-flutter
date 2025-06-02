import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quran/providers/audio_player_provider.dart';
import 'package:my_quran/providers/surah_provider.dart';
import 'package:my_quran/routes/app_routes.dart';

class SurahScreen extends ConsumerWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahState = ref.watch(surahProvider);
    final audioState = ref.watch(audioPlayerProvider);
    final audioNotifier = ref.read(audioPlayerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Surah'),
      ),
      body: surahState.when(
        data: (surah) {
          return ListView.builder(
            itemCount: surah.data?.length ?? 0,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final data = surah.data?[index];
              final isCurrentAudio =
                  audioState.currentSongUrl == data?.audioFull?.s05;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      data?.nomor.toString() ?? '0',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  title: Text(
                    data?.namaLatin ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data?.arti ?? ''),
                      if (isCurrentAudio && audioState.isPlaying)
                        Column(
                          children: [
                            const SizedBox(height: 8),
                            Slider(
                              value: audioState.position.inSeconds.toDouble(),
                              min: 0,
                              max: audioState.duration.inSeconds.toDouble(),
                              onChanged: (value) {
                                audioNotifier
                                    .seek(Duration(seconds: value.toInt()));
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_formatDuration(audioState.position)),
                                Text(_formatDuration(audioState.duration)),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isCurrentAudio && audioState.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      if (isCurrentAudio) {
                        if (audioState.isPlaying) {
                          await audioNotifier.pause();
                        } else {
                          await audioNotifier.resume();
                        }
                      } else {
                        await audioNotifier.play(data?.audioFull?.s05 ?? '');
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detailSurah,
                      arguments: {'id': data?.nomor},
                    );
                  },
                ),
              );
            },
          );
        },
        error: (error, stacktrace) => _buildErrorWidget(ref, error),
        loading: () => _buildLoadingWidget(),
      ),
    );
  }

  Widget _buildErrorWidget(WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            'Gagal memuat data',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(surahProvider),
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/lottie_loading.json',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 16),
          const Text('Memuat data surah...'),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }
}
