import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExpandibleCardController extends GetxController {
  static ExpandibleCardController get to => Get.find<ExpandibleCardController>();
  final scrollController = ScrollController();

  //Variable que nos ayudara con el tamaño inicial y posteriores de nuestro card expandible
  final heightCardExpanded = 250.0.obs;

  final isScrollListData = false.obs;

  //Variable que nos ayudara a almecenar los datos escritos en el inpiut y a mostrarlos en el card expandible
  final listDataInput = RxList<String>([]);

  addHeightCardExpanded(double offsetDy) {
    if (offsetDy < 0) {
      if (heightCardExpanded.value <= 250) {
        heightCardExpanded.value = 250;
      } else {
        heightCardExpanded.value -= 20;
      }
      isScrollListData.value = false;
    } else {
      if (heightCardExpanded.value >= 520) {
        heightCardExpanded.value = 520;
        isScrollListData.value = true;
      } else {
        heightCardExpanded.value += 20;
        isScrollListData.value = false;
      }
    }
  }

  addDataOfInput(String data) {
    if (data.isEmpty) return;
    listDataInput.add(data);
    downListData();
  }

  downListData() {
    debugPrint("downListData:");

    scrollController.animateTo(scrollController.position.maxScrollExtent + 120, duration: const Duration(milliseconds: 450), curve: Curves.ease);
  }

  onListenigScrollData() {
    scrollController.addListener(() async {
      debugPrint("heightCardExpanded: $heightCardExpanded");
      debugPrint("maxScrollExtent: ${scrollController.position.maxScrollExtent}");
      debugPrint("offset: ${scrollController.offset}");

      if ((scrollController.offset > scrollController.position.maxScrollExtent + 50) && heightCardExpanded.value == 520) {
        debugPrint("MAXSCROLL: ${scrollController.offset}");

        heightCardExpanded.value = 250;

        isScrollListData.value = false;
        await 0.5.delay();
        downListData();
      }
    });
  }

  @override
  void onInit() {
    onListenigScrollData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
