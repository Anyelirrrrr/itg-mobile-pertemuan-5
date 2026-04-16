import 'package:flutter/material.dart';
import 'package:pertemuan4_anyelir_2306128/chip_widget.dart';
import 'package:pertemuan4_anyelir_2306128/header_widget.dart';
import 'package:pertemuan4_anyelir_2306128/quest_widget.dart'; // Jangan lupa import QuestWidget

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulasi data quest yang dinamis
    final List<Map<String, String>> questData = [
      {"title": "Kalahkan 3 Tikus", "reward": "20+ MBG"},
      {"title": "Kumpulkan 10 Kayu", "reward": "50+ EXP"},
      {"title": "Bantu Warga Desa", "reward": "100+ Gold"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adventure Guild"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Diperbaiki dari .start
          children: [
            const HeaderWidget( // Pastikan nama class di header_widget.dart sudah "HeaderWidget", bukan "HeaderWidgetA"
              name: "Sunoo",
              role: "Enhypen",
              level: 9999,
            ),
            const SizedBox(height: 8),
            const Row(
              spacing: 8,
              children: [
                ChipWidget(
                  icon: Icons.favorite,
                  label: "HP",
                  value: 999,
                  backgroundColor: Colors.red,
                  borderColor: Colors.red,
                ),
                ChipWidget(
                  icon: Icons.shield,
                  label: "DEF",
                  value: 100,
                  backgroundColor: Colors.blueAccent,
                  borderColor: Colors.blueAccent,
                ),
                ChipWidget(
                  icon: Icons.water_drop,
                  label: "DMG",
                  value: 9999,
                  backgroundColor: Colors.yellow,
                  borderColor: Colors.yellow,
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Today's Quests",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 12),
            // Menggunakan Expanded & ListView agar list quest bisa di-scroll jika datanya banyak
            Expanded(
              child: ListView.separated(
                itemCount: questData.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final quest = questData[index];
                  return QuestWidget(
                    title: quest["title"]!,
                    reward: quest["reward"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}