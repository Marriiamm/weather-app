import 'package:get/get.dart';

import 'global_controller.dart';


class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(
      () => GlobalController(),
    );
  }
}