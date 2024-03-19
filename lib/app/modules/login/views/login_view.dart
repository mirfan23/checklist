import 'package:checklist/app/global_widgets/custom_text_field.dart';
import 'package:checklist/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 0.5.sw,
              ),
              CustomTextField(
                title: 'Username',
                hint: 'Username',
                textInputType: TextInputType.emailAddress,
                textEditingController: controller.usernameController,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                title: 'Password',
                hint: 'Password',
                obsecureText: true,
                textEditingController: controller.passwordController,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await controller.login(
                      controller.usernameController.text,
                      controller.passwordController.text,
                    );
                  } catch (e) {
                    print('Error: $e');
                  }
                },
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppPages.REGISTER),
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
