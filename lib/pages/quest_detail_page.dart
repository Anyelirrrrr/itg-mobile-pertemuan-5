import 'package:flutter/material.dart';
import '../models/quest.dart';
import '../main.dart';

class QuestDetailPage extends StatefulWidget {
  final Quest quest;

  const QuestDetailPage({super.key, required this.quest});

  @override
  State<QuestDetailPage> createState() => _QuestDetailPageState();
}

class _QuestDetailPageState extends State<QuestDetailPage> {
  late Quest quest;

  @override
  void initState() {
    super.initState();
    quest = widget.quest;
  }

  Future<void> editQuest() async {
    final result = await Navigator.pushNamed(
      context,
      MyApp.routeForm,
      arguments: quest,
    );

    if (result is Quest) {
      setState(() => quest = result);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('✏️ Quest updated')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quest Detail'),
        backgroundColor: cs.inversePrimary,
        actions: [
          IconButton(
            onPressed: editQuest,
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quest.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(quest.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Reward: +${quest.rewardGold} gold',
                style: TextStyle(
                  color: cs.onSecondaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
