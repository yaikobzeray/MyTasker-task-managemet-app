import 'package:get/get.dart';

import '../../../task/model/task_model.dart';
import '../../../task/services/task_services.dart';

class ListOfAllTasksScreenController extends GetxController {
  final RxInt selectedFilterIndex = 0.obs;
  final RxString selectedFilterChoice = "All Tasks".obs;

  final RxList<Map<String, dynamic>> choices = [
    {"choice": "All Tasks", "value": 0},
    {"choice": "Completed", "value": 1},
    {"choice": "Pending", "value": 2},
    {"choice": "Overdue", "value": 3},
  ].obs;

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  final _taskServices = TaskServices();

  // Get all tasks initially
  Future<void> getAllTasks() async {
    tasks.value = await _taskServices.tasks;
  }

  // Filter tasks based on selected choice
  Future<void> filterBy({required String filter}) async {
    if (filter == "All Tasks") {
      tasks.value = await _taskServices.tasks;
    } else {
      tasks.value = await _taskServices.filterBy(filter: filter.toLowerCase());
    }
  }

  // When a filter is selected, update the choice and filter tasks
  void onFilterChanged(int index) async {
    selectedFilterIndex.value = index;
    selectedFilterChoice.value = choices[index]["choice"];
    await filterBy(filter: selectedFilterChoice.value);
  }
 Future<void> updateTaskStatus(String id, String newStatus) async {
    
    await _taskServices.updateTaskStatus(id, newStatus);

  }

  Future<void> deleteTask(String id)async{
    await _taskServices.removeTask(id);
  }
  @override
  void onInit() {
    super.onInit();
    getAllTasks(); // Load all tasks initially
  }
}

