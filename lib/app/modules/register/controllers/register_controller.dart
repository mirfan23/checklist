import 'package:checklist/app/data/services/auth_service.dart';
import 'package:checklist/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late AuthService authService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    authService = Get.put(AuthService());
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register(
      String emailRegister, String passwordRegister, String username) async {
    try {
      await authService.register(emailRegister, passwordRegister, username);
      Get.defaultDialog(
        title: 'Register Berhasil',
        onConfirm: () => Get.back(),
      );
      emailController.clear();
      passwordController.clear();
      usernameController.clear();
      Get.offAllNamed(AppPages.INITIAL);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
