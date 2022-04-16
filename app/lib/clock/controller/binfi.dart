import 'package:get/get.dart';

import 'clock_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}
