import 'package:checklist/app/data/models/checklist_model.dart';
import 'package:checklist/app/data/provider/checklist_provider.dart';
import 'package:get/get.dart';

class ChecklistService extends GetxService {
  final ChecklistProvider checklistProvider = Get.put(ChecklistProvider());
  final RxList<Checklist> checklists = <Checklist>[].obs;
  final RxBool isLoading = true.obs;

  Future<void> getAllChecklists() async {
    try {
      var response = await checklistProvider.getAllChecklists();
      if (response.statusCode == 200) {
        var data = response.data['data'];
        List<Checklist> fetchedChecklists =
            data.map<Checklist>((item) => Checklist.fromJson(item)).toList();
        checklists.assignAll(fetchedChecklists); // Perbarui checklists
      } else {
        print('Error C Service: ${response.statusCode}');
      }
    } catch (e) {
      print('Error C Service 2: $e');
    }
  }

  Future<void> createChecklist(String name, String? item) async {
    try {
      var response = await checklistProvider.createChecklist(name);
      if (response.statusCode == 200) {
        print('Create checklist successful');
        await getAllChecklists();
      } else {
        print('Error C Service 3: ${response.statusCode}');
      }
    } catch (e) {
      print('Error C Service 4: $e');
    }
  }
}
