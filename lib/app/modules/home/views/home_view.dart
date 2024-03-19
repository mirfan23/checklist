import 'package:checklist/app/data/models/checklist_model.dart';
import 'package:checklist/app/data/services/checklist_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: FutureBuilder<List<ChecklistModel>>(
        future: loadChecklists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final todoLists = snapshot.data!;
            return ListView.builder(
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                final todoList = todoLists[index];
                return ListTile(
                  title: Text(todoList.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: todoList.items
                        .map((item) => CheckboxListTile(
                              title: Text(item.name),
                              value: item.completionStatus,
                              onChanged: (newValue) {
                                // Implement logic to update completion status
                              },
                            ))
                        .toList(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<ChecklistModel>> loadChecklists() async {
    await controller.authService.loadToken();
    return ChecklistService.getAllChecklists(
        controller.authService.token.value);
  }
}
