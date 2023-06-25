import 'package:apiget/UI/login/controller/login_controller.dart';
import 'package:apiget/UI/signup/binding/signUpBinding.dart';
import 'package:apiget/UI/signup/view/Signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/forgetpass_controller.dart';

class Forgetpage extends GetView<ForgetController> {
  const Forgetpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(
          child: CircularProgressIndicator.adaptive(),
        )
            : Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://icon-library.com/images/forgot-password-icon/forgot-password-icon-22.jpg',
              ),
              const SizedBox(height: 20.0),
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  'Provide Your Email for which You want to reset Your Password',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 25.0),
              Container(
                width: 290,
                child: TextField(
                  controller: controller.emailController.value,
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: controller.validateForget,
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
