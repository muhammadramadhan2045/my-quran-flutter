//create a screen for the doa page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quran/providers/doa_provider.dart';
import 'package:my_quran/routes/app_routes.dart';

class DoaScreen extends ConsumerWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the doa data from the provider
    final doaState = ref.watch(doaProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Doa'),
      ),
      body: doaState.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final doa = data[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(doa.id ?? ''),
                subtitle: Text(doa.doa ?? ''),
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.detailDoa,
                  arguments: {'name': doa.doa ?? ''},
                ),
              ),
            );
          },
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
