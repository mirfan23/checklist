import 'dart:convert';

import 'package:checklist/app/data/models/checklist_model.dart';
import 'package:checklist/app/data/provider/checklist_provider.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ChecklistService {
  static const String baseUrl = 'http://94.74.86.174:8080/api/checklist';

  static Future<List<ChecklistModel>> getAllChecklists(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((item) => ChecklistModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load todo lists');
    }
  }
}
