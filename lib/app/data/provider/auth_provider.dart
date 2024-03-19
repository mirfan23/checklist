import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  final Dio dio = Dio();
  var base_url = 'http://94.74.86.174:8080/api';

  Future<Response> register(
      String email, String password, String username) async {
    return await dio.post(
      '$base_url/register',
      data: {
        "email": email,
        "password": password,
        "username": username,
      },
    );
  }

  Future<Response> login(String username, String password) async {
    return await dio.post(
      '$base_url/login',
      data: {
        "password": password,
        "username": username,
      },
    );
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
