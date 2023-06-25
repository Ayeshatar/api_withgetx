import 'package:get/get.dart';


import '../controller/varifyotp_controller.dart';



class verifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController(
    ));
  }
}