import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/task_model.dart';


class TaskServices extends GetxService {

  Future<List<TaskModel>> get tasks async => await getTasks();
  Future<List<TaskModel>> filterBy({required String filter}) async {
    final tasks = await getTasks();
    return tasks.where((task) => task.status == filter).toList();
  }


  static const String _tasksKey = 'tasks';
  static const String _lastIdKey = 'last_task_id';

   Future<int> _getLastId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lastIdKey) ?? 0; 
  }
 Future<void> _setLastId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastIdKey, id);
  }

   // Generate the next incremental ID
  Future<int> _generateNewId() async {
    int lastId = await _getLastId();
    int newId = lastId + 1;
    await _setLastId(newId);
    return newId;
  }
  // save new task
  Future<void> saveTask({required String title, required String description, required String dueDate}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksList = prefs.getStringList(_tasksKey) ?? [];
    int newId = await _generateNewId();
    final task = TaskModel(id: newId.toString(), title: title, description: description, dueDate: dueDate, status: "pending");
    tasksList.add(jsonEncode(task.toJson()));
    await prefs.setStringList(_tasksKey, tasksList);
  }

  // Retrieve all tasks from SharedPreferences
  Future<List<TaskModel>> getTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> tasksList = prefs.getStringList(_tasksKey) ?? [];

    return tasksList
        .map((taskJson) => TaskModel.fromJson(jsonDecode(taskJson)))
        .toList();
  }

 // Remove a task from SharedPreferences by title or unique ID
  Future<void> removeTask(String id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  List<String> tasksList = prefs.getStringList(_tasksKey) ?? [];
  print(tasksList);
    tasksList.removeWhere((taskJson) {
    final task = TaskModel.fromJson(jsonDecode(taskJson));
    return task.id == id;
  });

    await prefs.setStringList(_tasksKey, tasksList);
  }

// Update a task's status by ID
  Future<void> updateTaskStatus(String id, String newStatus) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksList = prefs.getStringList(_tasksKey) ?? [];

    // Find and update the task's status
    List<String> updatedTasksList = tasksList.map((taskJson) {
      final task = TaskModel.fromJson(jsonDecode(taskJson));
      if (task.id == id.toString()) {
        // Update the status of the task
        task.status = newStatus;
      }
      return jsonEncode(task.toJson()); // Save the updated task back as JSON string
    }).toList();

    // Save the updated task list back to SharedPreferences
    await prefs.setStringList(_tasksKey, updatedTasksList);
  }

   // Method to update a task by its ID
 Future<void> updateTask({
    required String id,
    String? title,
    String? description,
    String? dueDate,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksList = prefs.getStringList(_tasksKey) ?? [];

    // Find the index of the task to update
    final index = tasksList.indexWhere((taskJson) {
      final task = TaskModel.fromJson(jsonDecode(taskJson));
      return task.id == id.toString(); // Match the task ID
    });

    if (index != -1) {
      // Decode the task
      final taskJson = jsonDecode(tasksList[index]);
      final task = TaskModel.fromJson(taskJson);

      // Update task properties, excluding status
      if (title != null) task.title = title;
      if (description != null) task.description = description;
      if (dueDate != null) task.dueDate = dueDate;
      // Status remains unchanged

      // Replace the old task with the updated task
      tasksList[index] = jsonEncode(task.toJson());

      // Save the updated list back to SharedPreferences
      await prefs.setStringList(_tasksKey, tasksList);
    } else {
      print('Task with ID $id not found');
    }
  }
}