
import 'dart:developer';

import 'package:apiget/UI/SetPassword/services/setpassword_api_service.dart';
import 'package:apiget/UI/login/binding/login_binding.dart';
import 'package:apiget/UI/login/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {
  var isLoading = false.obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController = TextEditingController().obs;


Future setPassword() async {
    try{
    var response=await SetPasswordApiService.setPassword(confirmpassword: confirmpasswordController.value.text, newpassword: passwordController.value.text);
      if (response== true) {
        log('status 200');
        Get.offAll(() => const LoginPage(),binding: LoginBinding());
      }
    } catch (e) {
    }
  }
}