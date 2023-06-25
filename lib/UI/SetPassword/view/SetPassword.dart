import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/set_password_controller.dart';

class SetPassword extends GetView<SetPasswordController> {
  const SetPassword({super.key});

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
        :Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              const SizedBox(height: 10.0),
              TextFormField(
                controller: controller.passwordController.value,
                decoration: const InputDecoration(
                  labelText: 'Enter Your new password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: controller.confirmpasswordController.value,
                decoration: const InputDecoration(
                  labelText: 'confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.setPassword();
                    }, child: const Text('Update'),

                  )


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
