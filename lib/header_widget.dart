import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;

  // Nama constructor harus SAMA dengan nama class (HeaderWidget)
  const HeaderWidget({
    super.key,
    required this.name,
    required this.role,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 255, 255, 255), Colors.black],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  "https://picsum.photos/id/870/200/300?grayscale&blur=2",
                ),
              ),
              Positioned(
                right: 5,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Level $level",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(role), // Menggunakan variabel role agar dinamis
              ],
            ),
          )
        ],
      ),
    );
  }
}