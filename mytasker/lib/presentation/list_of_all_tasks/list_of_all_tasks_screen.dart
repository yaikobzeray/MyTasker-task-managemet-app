import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mytasker/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:mytasker/widgets/custom_fliter.dart';
import 'package:mytasker/widgets/task_card.dart';

import '../../widgets/no_tas_widget.dart';
import 'controller/list_of_all_tasks_screen_controller.dart';

class ListOfAllTasksScreen extends StatelessWidget {
  final controller = Get.put(ListOfAllTasksScreenController());

  ListOfAllTasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomFliter(
              controller: controller,
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.selectedFilterChoice.value == "All Tasks"
                    ? controller.getAllTasks()
                    : controller.filterBy(
                        filter: controller.selectedFilterChoice.value),
                builder: (context, snapshot) => Obx(
                  () => controller.tasks.isEmpty? Center(child: const NoResultsScreen()):  ListView.builder(
                    itemCount: controller.tasks.length,
                    itemBuilder: (context, index) => TaskCard(
                     externalCntroller: controller,
                     taskModel: controller.tasks[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
