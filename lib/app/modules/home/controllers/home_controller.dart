import 'package:checklist/app/data/models/checklist_model.dart';
import 'package:checklist/app/data/services/checklist_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ChecklistService checklistService;
  final RxList<Checklist> checklists = <Checklist>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    checklistService = Get.put(ChecklistService());
    getAllChecklists();
    super.onInit();
  }

  Future<void> getAllChecklists() async {
    try {
      await checklistService.getAllChecklists();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> createChecklist(String name, String? items) async {
    try {
      await checklistService.createChecklist(name, items);
      await getAllChecklists();
    } catch (e) {
      print('Error: $e');
    }
  }
}
