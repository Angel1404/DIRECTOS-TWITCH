import 'package:directos_twitch/bindings/binding_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.DRAWONIMAGEPAGE,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),
    ),
  );
}
