// lib/screens/cuaca_screen.dart
import 'package:flutter/material.dart';

class CuacaScreen extends StatefulWidget {
  const CuacaScreen({super.key});

  @override
  State<CuacaScreen> createState() => _CuacaScreenState();
}

class _CuacaScreenState extends State<CuacaScreen> {
  // Contoh data
  final List<Map<String, String>> hourlyForecast = [
    {"time": "13:00", "temp": "22°", "icon": "☀️"},
    {"time": "16:00", "temp": "24°", "icon": "🌤"},
    {"time": "19:00", "temp": "23°", "icon": "🌧"},
    {"time": "22:00", "temp": "21°", "icon": "🌙"},
  ];

  final List<Map<String, String>> dailyForecast = [
    {"day": "Mon", "status": "Mostly Clear", "temp": "29° / 16°", "icon": "🌤"},
    {"day": "Tue", "status": "Thunderstorms", "temp": "28° / 18°", "icon": "🌩"},
    {"day": "Wed", "status": "With Fog", "temp": "27° / 19°", "icon": "🌫"},
    {"day": "Thu", "status": "Sunny", "temp": "30° / 17°", "icon": "☀️"},
    {"day": "Fri", "status": "Showers", "temp": "26° / 19°", "icon": "🌧"},
    {"day": "Sat", "status": "Mostly Cloudy", "temp": "27° / 18°", "icon": "⛅"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7ebf0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Header ===
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blueAccent),
                    SizedBox(width: 5),
                    Text(
                      "Bandung, Indonesia",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Sat, 8 Nov",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // === Kartu Utama Cuaca ===
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8EC5FC), Color(0xFFE0C3FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud, size: 70, color: Colors.white),
                  const SizedBox(height: 10),
                  const Text(
                    "Mostly Cloudy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "21°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _InfoSmall(icon: Icons.water_drop, label: "30%", title: "Precipitation"),
                      _InfoSmall(icon: Icons.water, label: "20%", title: "Humidity"),
                      _InfoSmall(icon: Icons.air, label: "12 km/h", title: "Wind"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // === Forecast per Jam ===
            const Text(
              "Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyForecast.length,
                itemBuilder: (context, index) {
                  final item = hourlyForecast[index];
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item["time"]!, style: const TextStyle(color: Colors.black54)),
                        const SizedBox(height: 8),
                        Text(item["icon"]!, style: const TextStyle(fontSize: 26)),
                        const SizedBox(height: 8),
                        Text(item["temp"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // === 7 Hari Ke Depan ===
            const Text(
              "7-Day Forecast",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Column(
              children: dailyForecast.map((day) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(day["day"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text(day["icon"]!, style: const TextStyle(fontSize: 22)),
                          const SizedBox(width: 10),
                          Text(day["status"]!, style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Text(day["temp"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSmall extends StatelessWidget {
  final IconData icon;
  final String label;
  final String title;

  const _InfoSmall({
    required this.icon,
    required this.label,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 25),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
