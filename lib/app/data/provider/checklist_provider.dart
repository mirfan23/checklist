import 'package:checklist/app/data/provider/auth_provider.dart';
import 'package:dio/dio.dart';

class ChecklistProvider {
  final Dio dio = Dio();
  var base_url = 'http://94.74.86.174:8080/api';
  final AuthProvider authProvider = AuthProvider();

  Future<Response> getAllChecklists() async {
    String token = await authProvider.getToken();
    return await dio.get(
      '$base_url/checklist',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
  }

  Future<Response> createChecklist(String name) async {
    String token = await authProvider.getToken();
    return await dio.post(
      '$base_url/checklist',
      data: {"name": name},
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
  }
}
