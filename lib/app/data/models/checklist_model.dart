class ChecklistModel {
  final int id;
  final String name;
  final List<ItemModel> items;
  final bool checklistCompletionStatus;

  ChecklistModel({
    required this.id,
    required this.name,
    required this.items,
    required this.checklistCompletionStatus,
  });

  factory ChecklistModel.fromJson(Map<String, dynamic> json) {
    List<ItemModel> itemsList = [];
    if (json['items'] != null) {
      itemsList = (json['items'] as List<dynamic>)
          .map((item) => ItemModel.fromJson(item))
          .toList();
    }
    return ChecklistModel(
      id: json['id'],
      name: json['name'],
      items: itemsList,
      checklistCompletionStatus: json['checklistCompletionStatus'],
    );
  }
}

class ItemModel {
  final int id;
  final String name;
  final bool completionStatus;

  ItemModel({
    required this.id,
    required this.name,
    required this.completionStatus,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      completionStatus: json['completionStatus'],
    );
  }
}
