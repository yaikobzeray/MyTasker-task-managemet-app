import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mytasker/task/model/task_model.dart';
import 'package:mytasker/utils/theme.dart';
import 'package:mytasker/widgets/custom_fliter.dart';
import 'package:mytasker/widgets/no_tas_widget.dart';
import 'package:mytasker/widgets/qoute_card.dart';
import 'package:search_page/search_page.dart';

import '../../widgets/app_drawer.dart';
import '../../widgets/task_card.dart';
import 'controller/home_screen_controller.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: theme.colorScheme.primary,
            style: TabStyle.textIn,
            items: const [
              TabItem(
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.add,
                title: "New",
              ),
              TabItem(
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.home,
                title: "Home",
              ),
              TabItem(
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.tasksAlt,
                title: "Tasks",
              ),
            ],
            initialActiveIndex: 1,
            onTap: (int i) => controller.selectedScreenIndex.value = i),
        appBar: AppBar(
          foregroundColor: theme.colorScheme.primary,
          forceMaterialTransparency: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage<TaskModel>(
                    barTheme: ThemeData(colorScheme: theme.colorScheme),
                    items: controller.tasks,
                    filter: (TaskModel) {
                      return [
                        TaskModel.title,
                        TaskModel.description,
                        TaskModel.status
                      ];
                    },
                    failure: const Center(
                      child: NoResultsScreen(),
                    ),
                    searchStyle: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.primary,
                    ),
                    builder: (task) {
                      return TaskCard(
                        externalCntroller: controller,
                        taskModel: task,
                      );
                    },
                    searchLabel: 'Search here',
                    suggestion: Center(
                      child: Text(
                        'Search Exam, Question',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: theme.colorScheme.primary),
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(
                // ignore: deprecated_member_use
                FontAwesomeIcons.search,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Obx(
            () => controller.screens[controller.selectedScreenIndex.value]));
  }
}

class HomeScreenWidget extends GetWidget<HomeScreenController> {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                       Text(
                DateFormat.MMMEd().format(DateTime.now()),
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  letterSpacing: -0.17,
                  color: theme.colorScheme.primary
                ),
              ),
                      Text(
                        "Today",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: -0.17,
                          color: theme.colorScheme.primary
                        ),
                      ),
                    ],
                  ),
                  Gap(size.width * 0.05),
                ],
              ),
              Gap(size.height * 0.02),
              FutureBuilder(
                future: controller.fetchQuotes(),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : QouteCard(
                            qoute: controller.qoute['content']!,
                            qouteBy: controller.qoute['author']!,
                          ),
              ),
              Gap(
                size.height * 0.032,
              ),
              CustomFliter(
                controller: controller,
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.getAllTasks(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Obx(
                              () => controller.tasks.isEmpty
                                  ? const NoResultsScreen()
                                  : ListView.builder(
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
      ),
    );
  }
}
