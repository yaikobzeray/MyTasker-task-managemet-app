
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasker/presentation/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}