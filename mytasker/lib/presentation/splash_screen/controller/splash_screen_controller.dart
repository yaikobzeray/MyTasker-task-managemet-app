import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../notification/controller/notification_controller.dart';

class SplashScreenController extends GetxController {
  DateTime _nextInstanceOfTime(int hour) {
    DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(now.year, now.month, now.day, hour);

    // If the time has already passed for today, schedule it for tomorrow
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
  @override
  void onReady() {
    DateTime morningTime = _nextInstanceOfTime(6); // 6:00 AM
    DateTime eveningTime = _nextInstanceOfTime(18);
    NotificationService.scheduleNotification(12, "My Tasker",
        "Good monring, set your daily plan with me!", morningTime);
    NotificationService.scheduleNotification(
        12, "My Tasker", "Hi there, check how was your day!", eveningTime);

    Future.delayed(
      const Duration(seconds: 2),
      () async {
        NotificationService.showInstantNotification(
            "My Tasker", "Welcome, your task companion!");
        Get.offAllNamed(AppRoutes.homeScreen);
      },
    );
    super.onReady();
  }
}
