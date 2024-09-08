import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasker/presentation/home_screen/controller/home_screen_controller.dart';
import './presentation/notification/controller/notification_controller.dart';
import 'package:mytasker/routes/routes.dart';
import 'package:timezone/data/latest.dart' as tz;


import 'presentation/splash_screen/binding/splash_screen_binding.dart';
import 'presentation/splash_screen/splash_screen.dart';
import 'utils/theme.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final homeController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return  Obx(
      ()=> (
         GetMaterialApp(
            theme:homeController.isDarkMode.value?ThemeData(colorScheme: const ColorScheme.dark(
            )): ThemeData(colorScheme: const ColorScheme.light(
            )),
            debugShowCheckedModeBanner: false,
            initialBinding: SplashScreenBinding(),
            home: const SplashScreen(),
             getPages: AppRoutes.pages,
          
         )  
      ),
    );
  }
}
