import 'package:get/get.dart';

import '../ui/ui.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ExpandibleCardController>(() => ExpandibleCardController());
  }
}
