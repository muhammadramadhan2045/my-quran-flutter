class StringUtils {
  // Hapus karakter tertentu dari string
  static String deleteKarakter(String word, String character) {
    return word.replaceAll(character, '');
  }
}
