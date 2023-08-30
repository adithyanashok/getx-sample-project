import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void changeTheme(value) {
    isDarkMode.value = value;
    if (isDarkMode == true) {
      Get.changeTheme(ThemeData.dark(useMaterial3: true));
    } else {
      Get.changeTheme(ThemeData.light(useMaterial3: true));
    }
    update();
  }
}
