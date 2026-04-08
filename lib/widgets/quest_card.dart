import 'package:flutter/material.dart';
import '../models/quest.dart';

class QuestCard extends StatelessWidget {
  final Quest quest;
  final VoidCallback onTap;

  const QuestCard({
    super.key,
    required this.quest,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(Icons.flag, color: cs.onPrimaryContainer),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quest.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Chip(
              label: Text('+${quest.rewardGold}g'),
              backgroundColor: cs.secondaryContainer,
              side: BorderSide(color: Colors.black.withOpacity(0.05)),
            ),
          ],
        ),
      ),
    );
  }
}