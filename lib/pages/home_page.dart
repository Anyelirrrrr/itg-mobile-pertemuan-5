import 'package:flutter/material.dart';
import '../models/quest.dart';
import '../widgets/quest_card.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Quest> quests = [
    const Quest(id: 'q1', title: 'Kalahkan 3 Goblin', description: 'Buktikan skill kamu di hutan.', rewardGold: 20),
    const Quest(id: 'q2', title: 'Cari 2 Potion', description: 'Beli/temukan potion di toko.', rewardGold: 10),
    const Quest(id: 'q3', title: 'Latihan di Arena', description: 'Naikkan HP dan mental!', rewardGold: 15),
  ];

  Future<void> openCreateForm() async {
    final result = await Navigator.pushNamed(context, MyApp.routeForm);
    if (result is Quest) {
      setState(() => quests.insert(0, result));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Quest dibuat: ${result.title}')),
      );
    }
  }

  Future<void> openDetail(Quest quest) async {
    // Detail bisa return sesuatu nanti (opsional). Untuk sekarang kita hanya navigasi.
    await Navigator.pushNamed(context, MyApp.routeDetail, arguments: quest);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quest Book'),
        backgroundColor: cs.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openCreateForm,
        icon: const Icon(Icons.add),
        label: const Text('New Quest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Quests',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: quests.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  final quest = quests[i];
                  return QuestCard(
                    quest: quest,
                    onTap: () => openDetail(quest),
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