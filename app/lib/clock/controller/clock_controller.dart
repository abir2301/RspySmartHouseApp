import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Rx<DateTime> dateTime = DateTime.now().obs;
  RxBool status = false.obs;
  RxBool exist = false.obs;
  Rx<IconData> icon = Icons.radio_button_unchecked.obs;

  @override
  void onInit() {
    {
      Timer.periodic(Duration(seconds: 1), (timer) {
        dateTime.value = DateTime.now();
      });
      super.onInit();
    }
  }
}
