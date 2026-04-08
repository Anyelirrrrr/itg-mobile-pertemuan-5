import 'package:flutter/material.dart';
import '../models/quest.dart';

class QuestFormPage extends StatefulWidget {
  final Quest? existing;

  const QuestFormPage({super.key, this.existing});

  @override
  State<QuestFormPage> createState() => _QuestFormPageState();
}

class _QuestFormPageState extends State<QuestFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleC;
  late final TextEditingController descC;
  late final TextEditingController goldC;

  bool saving = false;

  @override
  void initState() {
    super.initState();

    titleC = TextEditingController(text: widget.existing?.title ?? '');
    descC = TextEditingController(text: widget.existing?.description ?? '');
    goldC = TextEditingController(
      text: (widget.existing?.rewardGold ?? 10).toString(),
    );
  }

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    goldC.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => saving = true);
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // biar terasa proses

    final gold = int.parse(goldC.text);

    final quest = Quest(
      id:
          widget.existing?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleC.text.trim(),
      description: descC.text.trim(),
      rewardGold: gold,
    );

    if (!mounted) return;
    Navigator.pop(context, quest); // ← return result ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Quest' : 'New Quest'),
        backgroundColor: cs.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleC,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Title wajib diisi';
                  if (v.trim().length < 3) return 'Minimal 3 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: descC,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'Description wajib diisi';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: goldC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Reward Gold',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'Reward wajib diisi';
                  final n = int.tryParse(v);
                  if (n == null) return 'Harus angka';
                  if (n <= 0) return 'Harus lebih dari 0';
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: saving ? null : save,
                icon: saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: Text(saving ? 'Saving...' : 'Save'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
