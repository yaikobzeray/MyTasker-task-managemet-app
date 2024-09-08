import 'package:get/get.dart';

class TaskController extends GetxController{
  RxBool isCompleted = false.obs;
  RxString selectedId = '-1'.obs;
}