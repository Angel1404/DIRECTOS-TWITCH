import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:directos_twitch/ui/ui.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Count : ${controller.count.value}",
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnGenery(
                  onPressed: controller.addCount,
                ),
                BtnGenery(
                  isEmergencyBtn: true,
                  titleBtn: "Menos",
                  onPressed: controller.removeCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
