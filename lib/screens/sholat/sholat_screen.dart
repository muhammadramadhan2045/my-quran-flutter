import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/providers/sholat_provider.dart';

class SholatScreen extends ConsumerWidget {
  const SholatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sholatState = ref.watch(sholatProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Sholat'),
      ),
      body: sholatState.when(
        data: (dataSholat) {
          final jadwal = dataSholat.data?.jadwal;
          final lokasi = dataSholat.data?.lokasi ?? '';
          final daerah = dataSholat.data?.daerah ?? '';

          if (jadwal == null) {
            return const Center(child: Text("Jadwal tidak tersedia."));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$lokasi, $daerah',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    jadwal.tanggal ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  const Divider(height: 24),
                  ..._buildSholatList(jadwal),
                ],
              ),
            ),
          );
        },
        error: (error, stacktrace) {
          return Center(
            child: Text(
              'Terjadi kesalahan: $error',
              style: const TextStyle(color: Colors.red),
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

List<Widget> _buildSholatList(dynamic jadwal) {
  final Map<String, String> waktuSholat = {
    'Imsak': jadwal.imsak,
    'Subuh': jadwal.subuh,
    'Terbit': jadwal.terbit,
    'Dhuha': jadwal.dhuha,
    'Dzuhur': jadwal.dzuhur,
    'Ashar': jadwal.ashar,
    'Maghrib': jadwal.maghrib,
    'Isya': jadwal.isya,
  };

  return waktuSholat.entries.map((entry) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            entry.key,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            entry.value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }).toList();
}
