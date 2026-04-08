class Quest {
  final String id;
  final String title;
  final String description;
  final int rewardGold;

  const Quest({
    required this.id,
    required this.title,
    required this.description,
    required this.rewardGold,
  });

  Quest copyWith({
    String? id,
    String? title,
    String? description,
    int? rewardGold,
  }) {
    return Quest(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      rewardGold: rewardGold ?? this.rewardGold,
    );
  }
}