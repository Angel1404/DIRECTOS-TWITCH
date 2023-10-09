import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  //Variable la cual va a ser nuestro count

  final count = 1.obs;

  //Funcion para incrementar el contador

  addCount() {
    count.value++;
  }

  //Funcion par decrementar el contador

  removeCount() {
    count.value--;
  }
}
