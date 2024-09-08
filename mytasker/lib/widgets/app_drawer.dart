import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mytasker/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:mytasker/presentation/list_of_all_tasks/controller/list_of_all_tasks_screen_controller.dart';
import 'package:mytasker/utils/image_constants.dart';
import 'package:mytasker/utils/theme.dart';
import 'package:mytasker/widgets/drawer_custom_button.dart';

class AppDrawer extends GetWidget<HomeScreenController> {
  final allTasksController = Get.put(ListOfAllTasksScreenController());
  AppDrawer({super.key});
  final icons = [
    ImageConstants.taskIcon,
    ImageConstants.taskCompleted,
    ImageConstants.taskPending,
    ImageConstants.taskOverdue,
  ];
  final selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async{
                    controller.isDarkMode.value = !controller.isDarkMode.value;
                    await controller.saveThemeMode();
                  },
                  icon: SvgPicture.asset(
                    ImageConstants.lamp,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.choices.length,
                itemBuilder: (context, index) => DrawerCustomButton(
                 color: controller.selectedFilterIndex.value ==
                          controller.choices[index]['value']?
                          theme.colorScheme.primary:
                      theme.colorScheme.secondary,
                  title: controller.choices[index]['choice'],
                  iconPath: icons[index],
                  onPressed: () {
                    controller.onFilterChanged(index);
                    controller.selectedScreenIndex.value = 2;
                    allTasksController.selectedFilterIndex.value = index;
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
