import 'dart:convert';
import 'dart:developer';

import 'package:apiget/UI/Otp/model/otp_model.dart';
import 'package:apiget/UI/login/binding/login_binding.dart';
import 'package:apiget/UI/login/view/loginscreen.dart';
import 'package:apiget/common/apiUrls.dart';
import 'package:apiget/common/appTexts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:apiget/UI/SetPassword/services/setpassword_api_service.dart';

import 'package:apiget/UI/SetPassword/binding/SetPasswordbindings.dart';
import 'package:apiget/UI/SetPassword/view/SetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/verify_otp_service.dart';
import '../model/verifyotp_model.dart';

class VerifyOtpController extends GetxController {
  var isLoading = false.obs;
  Rx<TextEditingController> otp = TextEditingController().obs;

  void validateAndLogin() {
    if (otp.value.text.isEmpty) {
      Get.snackbar(AppTexts.errorText, 'Otp can not be empty');
    } else {
      verifyOtpCall();
    }
  }

  Future verifyOtpCall() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString("ootp", otp.value.text);
      var response = await VerifyOtpApiService.otpService(otp: otp.value.text);
      if (response == true) {
        log('status 200');
        isLoading.value = false;
        Get.off(() => const SetPassword(), binding: SetPasswordBindings());
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}