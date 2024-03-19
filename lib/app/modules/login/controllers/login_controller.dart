import 'package:checklist/app/data/services/auth_service.dart';
import 'package:checklist/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late AuthService authService;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    authService = Get.put(AuthService());
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login(String username, String passwordLogin) async {
    try {
      await authService.login(passwordLogin, username);
      Get.defaultDialog(
        title: 'Register Berhasil',
        onConfirm: () => Get.back(),
      );
      usernameController.clear();
      passwordController.clear();
      Get.offAllNamed(AppPages.HOME);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
