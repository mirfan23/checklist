import 'package:checklist/app/data/provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final AuthProvider authProvider = AuthProvider();
  final RxString token = ''.obs;

  Future<void> register(String email, String password, String username) async {
    try {
      var response = await authProvider.register(email, password, username);
      if (response.statusCode == 200) {
        print('Register Berhasil');
      } else {
        throw Exception(
            'Registrasi gagal, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Registrasi gagal: $e');
    }
  }

  Future<void> login(String username, String password) async {
    try {
      var response = await authProvider.login(username, password);
      if (response.statusCode == 200) {
        var responseData = response.data;
        token.value = responseData['data']['token'];
        print('Login successful');
        await saveToken(token.value);
      } else {
        throw Exception('Login gagal, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Login gagal: $e');
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  @override
  void onInit() {
    loadToken();
    super.onInit();
  }
}
