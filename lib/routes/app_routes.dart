import 'package:flutter/material.dart';
import 'package:my_quran/screens/home/home_screen.dart';
import 'package:my_quran/screens/quran/detail_surah_screen.dart';
import 'package:my_quran/screens/quran/surah_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String surah = '/surah';
  static const String detailSurah = '/detail-surah';

  static Map<String, WidgetBuilder> routes() {
    return {
      home: (context) => const HomeScreen(),
      surah: (context) => const SurahScreen(),
      detailSurah: (context) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        return DetailSurahScreen(
          id: args['id'],
        );
      },
    };
  }
}
