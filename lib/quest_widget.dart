import 'package:flutter/material.dart';

class QuestWidget extends StatelessWidget {
  final String title;
  final String reward;

  const QuestWidget({
    super.key,
    required this.title,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Aksi ketika quest di-tap
      },
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withAlpha(14),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.greenAccent.withAlpha(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withAlpha(12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.task_alt, color: Colors.deepPurpleAccent),
            ),
            const SizedBox(width: 12), // Tambahan jarak antara icon dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Agar teks rata kiri
                children: [
                  Text(
                    title, // Menggunakan variabel title
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text("Reward : $reward") // Menggunakan variabel reward
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}