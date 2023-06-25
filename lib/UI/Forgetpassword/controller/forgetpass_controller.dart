import 'dart:convert';
import 'dart:developer';

import 'package:apiget/UI/Homescreen.dart';
import 'package:apiget/UI/login/model/login_model.dart';
import 'package:apiget/common/apiUrls.dart';
import 'package:apiget/common/appTexts.dart';
import 'package:flutter/material.dart';
import 'package:apiget/UI/Forgetpassword/model/forgetpass_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../verifyOtp/binding/verifyotp_binding.dart';
import '../../verifyOtp/view/verifyotpscreen.dart';

class ForgetController extends GetxController {
  var isLoading = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  void validateForget() {
    if (emailController.value.text.isEmpty) {
      Get.snackbar(AppTexts.errorText, 'Email cannot be empty');
    } else if (!emailController.value.text.isEmail) {
      Get.snackbar(AppTexts.errorText, 'Invalid email format');
    } else {
      forgetApiCall();
    }
  }

  Future<void> forgetApiCall() async {
    final prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    var body = {
      "email": emailController.value.text,
    };
    try {
      var response = await http.post(
        Uri.parse(
          ApiUrls.baseUrl + ApiUrls.forgetUrl,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      var data = jsonDecode(response.body);
      log('this is our data $data ');


      var result = ForgetModel.fromJson(data);

      if (result.success== true) {
        log('status 200');
        isLoading.value = false;
        log('result is =========== $result');
        Get.to(const verifyotpPage(email: '',), binding: verifyBinding());
      } else {
        isLoading.value = false;
        Get.snackbar(AppTexts.errorText, result.message);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}