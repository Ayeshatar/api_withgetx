import 'package:get/get.dart';

import '../controller/forgetpass_controller.dart';

class ForgetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetController>(() =>ForgetController(
    ));
  }
}