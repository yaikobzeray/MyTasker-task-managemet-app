import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';

class CustomFliter extends StatelessWidget {
  final controller;
  CustomFliter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.03,
      width: size.width,
      child: ListView.builder(
        itemCount: controller.choices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: size.width * 0.05),
          child: GestureDetector(
            onTap: () {
              controller.onFilterChanged(index);
            },
            child: Obx(
              () => Text(
                controller.choices[index]['choice'],
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: controller.selectedFilterIndex.value ==
                          controller.choices[index]['value']?
                          theme.colorScheme.primary:
                      theme.colorScheme.secondary,
                      
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
