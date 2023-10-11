import 'package:get/get.dart';

import '../ui/ui.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.EXPANDIBLECARDPAGE,
      page: () => const ExpandibleCardPage(),
    ),
  ];
}
