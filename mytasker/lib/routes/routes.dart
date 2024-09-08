import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mytasker/presentation/detail_screen/bindings/detail_screen_binding.dart';
import 'package:mytasker/presentation/detail_screen/detail_screen.dart';
import 'package:mytasker/presentation/home_screen/binding/home_screen_binding.dart';
import 'package:mytasker/presentation/home_screen/home_screen.dart';

class AppRoutes {
  static String homeScreen = '/homeScreen';
  static String detailScreen = '/detailScreen';
  static List<GetPage> pages = [
    GetPage(name: homeScreen,  page: () =>  HomeScreen(),
      bindings: [HomeScreenBinding()],),
    GetPage(name: detailScreen,  page: () =>  DetailScreen(),
      bindings: [DetailScreenBinding()],),
  ];
}