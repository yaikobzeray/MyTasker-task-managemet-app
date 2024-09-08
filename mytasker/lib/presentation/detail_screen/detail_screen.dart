import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mytasker/presentation/detail_screen/controller/deatil_screen_controller.dart';
import 'package:mytasker/task/model/task_model.dart';

import '../../utils/theme.dart';

class DetailScreen extends GetWidget<DetailScreenController> {
  final controller = Get.put(DetailScreenController());
  DetailScreen({super.key});
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      controller.selectedDate.value = picked;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Task Detail",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.primary),
                ),
                Gap(size.height * 0.05),
                Container(
                    height: size.height * 0.08,
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: theme.colorScheme.primary,
                        ),
                        Gap(size.width * 0.02),
                        Obx(
                          () => Text(
                            DateFormat('MMM d, yyyy')
                                .format(controller.selectedDate.value),
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: theme.colorScheme.primary,
                                letterSpacing: -0.17),
                          ),
                        ),
                        Gap(size.width * 0.45),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Icon(
                            FontAwesomeIcons.calendarDays,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    )),
                Gap(size.height * 0.02),
                Container(
                  height: size.height * 0.08,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => TextFormField(
                      readOnly: controller.readMode.value ? true : false,
                      controller: controller.titleController,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(
                          color: theme.colorScheme.primary, fontSize: 14),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Title",
                            style: GoogleFonts.roboto(
                              color: theme.colorScheme.primary.withOpacity(0.4),
                            ),
                          )),
                    ),
                  ),
                ),
                Gap(size.height * 0.02),
                Container(
                  height: size.height * 0.4,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => TextFormField(
                      readOnly: controller.readMode.value ? true : false,
                      controller: controller.descriptionController,
                      maxLines: 12,
                      textAlign: TextAlign.justify,
                      minLines: 1,
                      style: GoogleFonts.roboto(
                          color: theme.colorScheme.primary, fontSize: 14),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Descriptions",
                            style: GoogleFonts.roboto(
                              color: theme.colorScheme.primary.withOpacity(0.4),
                            ),
                          )),
                    ),
                  ),
                ),
                Gap(size.height * 0.05),
                Obx(
                  () => ElevatedButton(
                    onPressed: () async {
                      if (!controller.readMode.value) {
                        await controller.updateTask();
                      }
                       
                      controller.readMode.value = false;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.02,
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.2)),
                    child: Text(
                      controller.readMode.value ? "Edit" : "Save",
                      style: GoogleFonts.roboto(
                          color: theme.colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
