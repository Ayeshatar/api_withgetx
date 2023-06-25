import 'package:get/get.dart';
import '../controller/set_password_controller.dart';

class SetPasswordBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPasswordController>(() => SetPasswordController(
    ));
  }
}