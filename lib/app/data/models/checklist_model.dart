class ChecklistModel {
  int id;
  String name;
  List<TodoItem> items;
  bool checklistCompletionStatus;

  ChecklistModel({
    required this.id,
    required this.name,
    required this.items,
    required this.checklistCompletionStatus,
  });

  factory ChecklistModel.fromJson(Map<String, dynamic> json) {
    return ChecklistModel(
      id: json['id'],
      name: json['name'],
      items: (json['items'] as List)
          .map((item) => TodoItem.fromJson(item))
          .toList(),
      checklistCompletionStatus: json['checklistCompletionStatus'],
    );
  }
}

class TodoItem {
  String name;
  bool completionStatus;

  TodoItem({
    required this.name,
    required this.completionStatus,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      name: json['name'],
      completionStatus: json['completionStatus'],
    );
  }
}
