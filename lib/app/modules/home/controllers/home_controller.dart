import 'package:checklist/app/data/models/checklist_model.dart';
import 'package:checklist/app/data/services/auth_service.dart';
import 'package:checklist/app/data/services/checklist_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late AuthService authService;
  late ChecklistService checklistService;

  @override
  void onInit() {
    authService = Get.put(AuthService());
    checklistService = Get.put(ChecklistService());
    super.onInit();
  }

  Future<void> getAllChecklists() async {
    try {
      await ChecklistService.getAllChecklists(authService.token.value);
    } catch (e) {
      print('Error: $e');
    }
  }
}
