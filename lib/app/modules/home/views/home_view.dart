import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklists'),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.checklists.length,
          itemBuilder: (context, index) {
            var checklist = controller.checklists[index];
            return ListTile(
              title: Text(checklist.name),
              subtitle: Text(checklist.items.toString() ?? 'No Items'),
              trailing: Checkbox(
                value: checklist.checklistCompletionStatus,
                onChanged: (value) {
                  // Handle checkbox change
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCreateChecklistDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to show dialog for creating checklist
  void showCreateChecklistDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController itemsController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Checklist'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: itemsController,
                decoration: InputDecoration(labelText: 'Items'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.createChecklist(
                  nameController.text,
                  itemsController.text.isEmpty ? null : itemsController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
