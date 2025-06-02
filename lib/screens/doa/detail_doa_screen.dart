import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/providers/detail_doa_provider.dart';

class DetailDoaScreen extends ConsumerWidget {
  const DetailDoaScreen({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doaIdState = ref.watch(
      doaIdProvider(name),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: doaIdState.when(data: (data) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.doa ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  data.ayat ?? '',
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 16),
                Text(
                  data.latin ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 8),
                Text(
                  data.artinya ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }, error: (error, stacktrace) {
        return Center(
          child: Text('Error: $error'),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
