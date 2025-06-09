import 'package:flutter/material.dart';
import 'package:my_quran/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildPrayerTime(String name, String time, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
        Text(time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            )),
      ],
    );
  }

  Widget _buildFeatureButton(String label, IconData icon,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE7F5F8),
            radius: 24,
            child: Icon(icon, color: const Color(0xFF009688), size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 13))
        ],
      ),
    );
  }

  Widget _buildNgajiCard(String imageUrl, String viewers,
      {bool isLive = false}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: 160,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        if (isLive)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text("LIVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11)),
            ),
          ),
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.remove_red_eye, color: Colors.white, size: 13),
                const SizedBox(width: 3),
                Text(viewers,
                    style: const TextStyle(color: Colors.white, fontSize: 11))
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20BFA9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          // Main contents
          Column(
            children: [
              // Header with date, location, and prayer countdown
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("9 Ramadhan 1444 H",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                    const SizedBox(height: 2),
                    const Text("Jakarta, Indonesia",
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        "04:41",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        "Fajr 3 hour 9 min left",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Prayer times row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildPrayerTime("Fajr", "04:41", Icons.wb_twilight),
                        _buildPrayerTime("Dzuhur", "12:00", Icons.wb_sunny),
                        _buildPrayerTime("Asr", "15:14", Icons.sunny),
                        _buildPrayerTime("Maghrib", "18:02", Icons.nights_stay),
                        _buildPrayerTime("Isha", "19:11", Icons.nightlight),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Features & Ngaji Online section (white bg)
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      // Features
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("All Features",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildFeatureButton("Quran", Icons.menu_book,
                                    onTap: () {
                                  // Navigate to Quran screen
                                  Navigator.pushNamed(context, AppRoutes.surah);
                                }),
                                _buildFeatureButton(
                                    "Adzan", Icons.notifications_active,
                                    onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.sholat);
                                }),
                                _buildFeatureButton("Qibla", Icons.explore),
                                _buildFeatureButton(
                                    "Doa", Icons.volunteer_activism, onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.doa);
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Ngaji Online
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Ngaji Online",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                            TextButton(
                              onPressed: () {},
                              child: const Text("See All",
                                  style: TextStyle(
                                      color: Color(0xFF20BFA9),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      // Horizontal List of Ngaji Cards
                      Container(
                        height: 110,
                        margin: const EdgeInsets.only(left: 16),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildNgajiCard(
                              // Please replace with your asset or network image
                              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                              '3.6K viewers',
                              isLive: true,
                            ),
                            const SizedBox(width: 14),
                            _buildNgajiCard(
                              'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
                              '3.6K viewers',
                            ),
                            const SizedBox(width: 14),
                            _buildNgajiCard(
                              'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80',
                              '2.2K viewers',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
