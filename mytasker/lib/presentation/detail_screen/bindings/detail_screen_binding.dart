import 'package:get/get.dart';
import 'package:mytasker/presentation/detail_screen/controller/deatil_screen_controller.dart';

class DetailScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>DetailScreenController());
  }

}