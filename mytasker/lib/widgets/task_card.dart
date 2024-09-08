import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mytasker/presentation/detail_screen/detail_screen.dart';
import 'package:mytasker/routes/routes.dart';
import 'package:mytasker/task/model/controller/task_controller.dart';
import 'package:mytasker/task/model/task_model.dart';

import '../presentation/notification/controller/notification_controller.dart';
import '../utils/image_constants.dart';
import '../utils/theme.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final externalCntroller;
  TaskCard({
    super.key,
    required this.taskModel,
    required this.externalCntroller,
  });

  final _taskController = Get.put(TaskController());
bool isToday(DateTime date) {
  final DateTime now = DateTime.now();
  return date.year == now.year && date.month == now.month && date.day == now.day;
}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailScreen, arguments: {'task': taskModel});
      },
      child: Dismissible(
          key: ValueKey(taskModel.id), // Unique key for each item
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            externalCntroller.deleteTask(taskModel.id);
          },
          background: Container(
            color: Colors.red,
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            margin: const EdgeInsets.only(top: 15),
            width: size.width,
            height: 66,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colorScheme.primary.withOpacity(0.1)),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                  child: SvgPicture.asset(
                    taskModel.status == "complete"
                        ? ImageConstants.taskCompleted
                        : taskModel.status == "pending"
                            ? ImageConstants.taskPending
                            : taskModel.status == "ovedue"
                                ? ImageConstants.taskOverdue
                                : ImageConstants.taskIcon,
                    height: 24,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                Gap(size.height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.335,
                      child: Text(
                        taskModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.17),
                      ),
                    ),
                    Text(
                      isToday(DateTime.parse(taskModel.dueDate))? "Today":
                      DateFormat.yMMMEd()
                          .format(DateTime.parse(taskModel.dueDate)),
                      style: GoogleFonts.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          letterSpacing: -0.17),
                    ),
                    Obx(
                      () => Text(
                        // taskModel.status,
                        externalCntroller.tasks
                            .firstWhere((e) => e.id == taskModel.id)
                            .status,
                        style: GoogleFonts.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.17,
                          color: taskModel.status == "overdue"
                              ? theme.colorScheme.error
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(size.width * 0.18),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      await externalCntroller.updateTaskStatus(
                          taskModel.id,
                          externalCntroller.tasks
                                      .firstWhere((e) => e.id == taskModel.id)
                                      .status ==
                                  "pending"
                              ? "completed"
                              : "pending");
                      externalCntroller.onFilterChanged(0);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.005,
                      ),
                      decoration: BoxDecoration(
                          color: externalCntroller.tasks
                                      .firstWhere((e) => e.id == taskModel.id)
                                      .status ==
                                  "pending"
                              ? theme.colorScheme.secondary
                              : theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        externalCntroller.tasks
                                    .firstWhere((e) => e.id == taskModel.id)
                                    .status ==
                                "pending"
                            ? "complete"
                            : "pending",
                        style: GoogleFonts.roboto(
                            letterSpacing: -0.17,
                            fontSize: 10,
                            color: externalCntroller.tasks
                                        .firstWhere((e) => e.id == taskModel.id)
                                        .status ==
                                    "pending"
                                ? theme.colorScheme.onSecondary
                                : theme.colorScheme.secondary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
