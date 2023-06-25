import 'package:apiget/UI/login/controller/login_controller.dart';
import 'package:apiget/UI/signup/binding/signUpBinding.dart';
import 'package:apiget/UI/signup/view/Signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../Forgetpassword/binding/forget_binding.dart';
import '../../Forgetpassword/view/forgetpassscreen.dart';
import '../controller/varifyotp_controller.dart';

class verifyotpPage extends GetView<VerifyOtpController> {
  const verifyotpPage({super.key, required String email});

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>
            Scaffold(
                appBar: AppBar(
                  title: const Text('verifypassword'),
                ),
                body: controller.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
                    : Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: controller.otp.value,
                        decoration: const InputDecoration(
                          labelText: 'Enter Your otp',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      ElevatedButton(
                        onPressed: () => controller.validateAndLogin(),
                        child: const Text('Verify Otp'),
                      ),
                    ],),
                )));
  }
}

//void _login(BuildContext context, {String? email, String? password}) async {
//try {
//if (email == null || email.isEmpty || password == null || password.isEmpty) {
//  throw 'Please enter a valid email and password';
// }

// bool isStrongPassword(String password) {
// Implement your password strength validation logic here
// For example, you can check for a minimum length, presence of uppercase, lowercase, digits, and special characters
// return password.length >= 6 &&
//  RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()])').hasMatch(password);
//  }

//if (!isStrongPassword(password)) {
//  throw 'Please enter a valid password';
//  }
// print('Navigating to HomeScreen');
// Navigator.pushReplacement(
// context,
//  MaterialPageRoute(builder: (context) => Homescreen()),
// );
//} catch (error) {
//  throw error;
//  }
//  }

