import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasker/presentation/home_screen/controller/home_screen_controller.dart';
 ThemeData get theme  =>  ThemeHelper().themeData();
class ThemeHelper {
final controller = Get.put(HomeScreenController());
  ThemeData themeData() {
    print(controller.isDarkMode);
    return ThemeData(
      colorScheme: controller.isDarkMode.value? const ColorScheme.dark(
          primary: Color.fromRGBO(249, 249, 249, 0.235),
          // onPrimary: Colors.deepPurple,
          secondary: Color.fromARGB(255, 254, 254, 254),
          onSecondary: Color.fromARGB(255, 0, 0, 0))
      : const ColorScheme.light(
          primary: Color.fromRGBO(4, 170, 232, 1),
          onPrimary: Color.fromRGBO(212, 212, 212, 1),
          secondary: Color.fromRGBO(212, 212, 212, 1),),
 
    );
  }
}
