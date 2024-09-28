import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:draw_on_image_plugin/draw_on_image_plugin.dart';
import 'package:image/image.dart' as img;

class DrawOnImageController extends GetxController {
  static DrawOnImageController get to => Get.find<DrawOnImageController>();

  @override
  void onInit() {
    // drawOnTextToImage("""
    //     Fecha: 20/10/2023
    //     Location: 100.2020.222
    //     Nombre: Angel C
    //   """);

    super.onInit();
  }

  final imageAssets = "assets/apple.png";
  final fileImageWithText = File("").obs;

  Future<String> drawOnTextToImage(String text) async {
    const drawOnImage = DrawOnImage();
    // File("").readAsBytesSync();
    final imageBytes = await rootBundle.load(imageAssets);
    var writeData = WriteImageData(
      text,
      imageBytes,
      fontSize: 25,
      color: Colors.black.value,
    );
    final newImageWithText = await drawOnImage.writeTextOnImage(writeData);
    fileImageWithText.value = File(newImageWithText);

    return newImageWithText;
  }

  Future<File> exampleImageSimple(File pathImage, {String waterMaker = "Example waterMaker", img.BitmapFont? font, int dX = 0, int? dY}) async {
    final image = img.decodeImage(await pathImage.readAsBytes());
    img.drawString(
      image!,
      """
      Fecha: 20/10/2023
      Location: 100.2020.222
      Nombre: Angel C
      """,
      font: font ?? img.arial14,
      x: dX,
      y: dY ?? image.height - 50,
    );
    return fileImageWithText.value = await pathImage.writeAsBytes(img.encodePng(image));
  }
}
