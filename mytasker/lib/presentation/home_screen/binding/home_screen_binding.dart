import 'package:get/get.dart';
import 'package:mytasker/presentation/home_screen/controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
