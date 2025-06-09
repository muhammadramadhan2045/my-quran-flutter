const String quranBaseUrl = 'https://equran.id/api/v2';
const String doaBaseUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';
const String quran2BaseUrl = 'https://api.myquran.com/v2';

get surahUrl => '$quranBaseUrl/surat';
get doaUrl => '$doaBaseUrl/';
get doaDetailUrl => '$doaBaseUrl/doa';
get sholatScheduleUrl => '$quran2BaseUrl/sholat/jadwal';
