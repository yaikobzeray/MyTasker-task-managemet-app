import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasker/task/model/task_model.dart';
import 'package:mytasker/task/services/task_services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../add_task_screen/add_task_screen.dart';
import '../../list_of_all_tasks/list_of_all_tasks_screen.dart';
import '../../notification/controller/notification_controller.dart';
import '../home_screen.dart';

class HomeScreenController extends GetxController {
 final RxInt selectedScreenIndex = 1.obs;
  final screens = [ AddTaskScreen(),const HomeScreenWidget(), ListOfAllTasksScreen()].obs;
  
  final RxInt selectedFilterIndex = 0.obs;
  final RxString selectedFilterChoice = "All Tasks".obs;
RxMap<String, String> qoute = <String, String>{}.obs;


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
    // Fetch all tasks from the service
    var allTasks = await _taskServices.tasks;

    // Filter tasks for today
    tasks.value = _filterTasksForToday(allTasks);
  }

  List<TaskModel> _filterTasksForToday(List<TaskModel> tasks) {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    return tasks.where((task) {
      final taskDueDate = DateTime.parse(task.dueDate); // Assuming you have a dueDate field
      return taskDueDate.isAfter(startOfDay) && taskDueDate.isBefore(endOfDay);
    }).toList();
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
  void onInit() async{
    super.onInit();
           

    getAllTasks(); // Load all tasks initially
  }

  Future<void> fetchQuotes() async {
  final url = Uri.parse('https://api.quotable.io/random');
  
  final response = await http.get(
    url,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Quotes: ${data["author"]}');
    qoute.value = {'content':data["content"],"author":data["author"]};

  } else {
    print('Failed to load quotes: ${response.statusCode}');
  }
}


     String _key = 'isDarkMode';
   RxBool isDarkMode = false.obs;
  Future<void> saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode.value);
  }

  Future<bool> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false; // Default to light mode if not set
  }
}


