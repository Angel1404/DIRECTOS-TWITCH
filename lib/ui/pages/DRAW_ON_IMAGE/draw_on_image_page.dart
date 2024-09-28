import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../ui.dart';

class DrawOnImagePage extends GetView<DrawOnImageController> {
  const DrawOnImagePage({super.key});
  final repairKey = const Key("RepaintBoundary1");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                if (controller.fileImageWithText.value.path.isEmpty) {
                  return const Center(
                    child: Text("Sin imagen"),
                  );
                }
                return Image.file(
                  controller.fileImageWithText.value,
                );
              },
            ),
            IconButton(
                onPressed: () async {
                  final imagePicker = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    maxHeight: 350,
                    maxWidth: 350,
                  );
                  debugPrint(imagePicker!.path);

                  // final bytes = await File(imagePicker.path).readAsBytes();

                  await controller.exampleImageSimple(File(imagePicker.path));
                  // controller.fileImageWithText.value = await File(imagePicker.path).writeAsBytes(result.buffer.asUint8List());

                  //             controller.drawOnTextToImage2(imagePicker.path, """
                  //   Fecha: 20/10/2023
                  //   Location: 100.2020.222
                  //   Nombre: Angel C
                  // """);
                },
                icon: const Icon(Icons.camera)),
            RepaintBoundary(
              key: repairKey,
              child: Container(
                height: 80,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () {
                    if (controller.fileImageWithText.value.path.isEmpty) {
                      return const Center(
                        child: Text("Sin imagen"),
                      );
                    }

                    return Stack(
                      children: [
                        Image.file(
                          controller.fileImageWithText.value,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              """
                                Fecha: 20/10/2023
                                Location: 100.2020.222
                                Nombre: Angel C
                              """,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
