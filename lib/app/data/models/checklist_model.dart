class Checklist {
  final int id;
  final String name;
  final List<String>? items;
  final bool checklistCompletionStatus;

  Checklist({
    required this.id,
    required this.name,
    this.items,
    required this.checklistCompletionStatus,
  });

  factory Checklist.fromJson(Map<String, dynamic> json) {
    return Checklist(
      id: json['id'],
      name: json['name'],
      items: json['items'] != null ? List<String>.from(json['items']) : null,
      checklistCompletionStatus: json['checklistCompletionStatus'],
    );
  }
}
