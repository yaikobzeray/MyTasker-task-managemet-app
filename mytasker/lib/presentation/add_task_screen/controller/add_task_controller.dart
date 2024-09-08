import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasker/task/model/task_model.dart';
import 'package:mytasker/task/services/task_services.dart';

class AddTaskController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _taskServices = TaskServices();
  Future<void> saveTask() async {
    if (titleController.text.isEmpty) {
      Get.snackbar("Erorr", "Title is required");
      return;
    }
    await _taskServices.saveTask(
      title: titleController.text,
      description: descriptionController.text,
      dueDate: selectedDate.value.toString(),
    );
    selectedDate.value = DateTime.now();
    titleController.clear();
    descriptionController.clear();
    Get.snackbar("Success", "Saved successfuly");
  }

  
  Future<void> updateTaskStatus(String id, String newStatus) async {
    
    await _taskServices.updateTaskStatus(id, newStatus);

  }
}
