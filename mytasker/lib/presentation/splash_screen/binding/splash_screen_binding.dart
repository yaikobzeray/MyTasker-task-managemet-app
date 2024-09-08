import 'package:get/get.dart';
import 'package:mytasker/presentation/splash_screen/controller/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
        Get.lazyPut(()=> SplashScreenController());
  }

}