import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui.dart';

class ExpandibleCardPage extends StatefulWidget {
  const ExpandibleCardPage({super.key});

  @override
  State<ExpandibleCardPage> createState() => _ExpandibleCardPageState();
}

class _ExpandibleCardPageState extends State<ExpandibleCardPage> {
  final controllerInput = TextEditingController();
  final controller = ExpandibleCardController.to;
  @override
  void dispose() {
    controllerInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Alto del telefono: ${Get.height}");
    debugPrint("acho del telefono: ${Get.width}");

    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Align(alignment: Alignment.topCenter, child: ExpandibleCard()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: Get.width,
                height: 50,
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: controllerInput,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.green, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.addDataOfInput(controllerInput.text),
                      icon: const Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableScrollSheet extends StatelessWidget {
  const DraggableScrollSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.blue[100],
          child: ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        );
      },
    );
  }
}

class ExpandibleCard extends StatelessWidget {
  ExpandibleCard({super.key});
  final controller = ExpandibleCardController.to;
  @override
  Widget build(BuildContext context) {
    debugPrint("heightCardExpanded 1: ${controller.heightCardExpanded}");

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        debugPrint("onVerticalDragUpdate: $details");

        FocusScope.of(context).unfocus();
        controller.addHeightCardExpanded(details.delta.dy);
      },
      child: Obx(
        () => AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 450),
          height: controller.heightCardExpanded.value,
          constraints: const BoxConstraints(maxHeight: 520, minHeight: 250),
          width: double.maxFinite,
          color: Colors.red,
          child: ListView.builder(
            physics: controller.isScrollListData.value ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
            controller: controller.scrollController,
            itemCount: controller.listDataInput.length,
            itemBuilder: (context, index) {
              final data = controller.listDataInput[index];
              return Container(
                height: 125,
                margin: const EdgeInsets.only(bottom: 8, right: 16),
                width: double.maxFinite,
                alignment: Alignment.centerRight,
                child: Text(data, style: TextStyleApp.btnGenery),
              );
            },
          ),
        ),
      ),
    );
  }
}
