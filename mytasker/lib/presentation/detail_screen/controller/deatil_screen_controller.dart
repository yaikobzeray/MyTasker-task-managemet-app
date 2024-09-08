import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasker/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:mytasker/task/model/task_model.dart';

import '../../../task/services/task_services.dart';

class DetailScreenController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final homeScreenController = Get.put(HomeScreenController());
  final _taskServices = TaskServices();
  RxBool readMode = true.obs;

  late TaskModel taskModel;

  @override
  void onInit() {
    taskModel = Get.arguments['task'] as TaskModel;
    selectedDate.value = DateTime.parse(taskModel.dueDate);
    titleController.text = taskModel.title;
    descriptionController.text = taskModel.description;
    super.onInit();
  }

  Future<void> updateTask() async {
    if(titleController.text.isEmpty){
      Get.snackbar("Error", "Title is required");
      return;
    }

    await  _taskServices.updateTask(
     id: taskModel.id,
      title: titleController.text,
      description: descriptionController.text,
      dueDate: selectedDate.value.toString(),
    );
      // Get.snackbar("Success", "Task updated successfuly");
       homeScreenController.getAllTasks();
    Get.back();


  }
}
