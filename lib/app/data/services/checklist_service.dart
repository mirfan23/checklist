import 'package:checklist/app/data/models/checklist_model.dart';
import 'package:dio/dio.dart';

class ChecklistService {
  static const String baseUrl = 'http://94.74.86.174:8080/api/checklist';

  static Future<List<ChecklistModel>> getAllChecklists(String token) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get(
        baseUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<ChecklistModel> checklistList = [];
        final List<dynamic> jsonData = response.data['data'];
        for (var item in jsonData) {
          List<dynamic>? itemsData =
              item['items']; // Handle the case where 'items' can be null
          List<ItemModel> itemsList = [];
          if (itemsData != null) {
            itemsList =
                itemsData.map((item) => ItemModel.fromJson(item)).toList();
          }
          checklistList.add(
            ChecklistModel(
              id: item['id'],
              name: item['name'],
              items: itemsList,
              checklistCompletionStatus: item['checklistCompletionStatus'],
            ),
          );
        }
        return checklistList;
      } else {
        throw Exception('Failed to load todo lists');
      }
    } catch (e) {
      throw Exception('Failed to load todo lists: $e');
    }
  }
}
