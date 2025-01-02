import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/controllers/forgot_password%20controller.dart';

import 'package:next_cart/utils/app_constant_class.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  final userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisibility) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppConst.appMainColor,
            title: Text(
              'Forgot Password',
              style: TextStyle(color: AppConst.appTextColor),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppConst.appMainColor,
                  width: double.infinity,
                  height: Get.height * .3,
                  child: Lottie.asset(
                    'assets/images/Animation - 1735706732575.json',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userEmail,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppConst.appMainColor),
                          onPressed: () async {
                            String email = userEmail.text.trim();
                            if (email.isEmpty) {
                              Get.snackbar('Error', 'Please enter all detail');
                            } else {
                              String email=userEmail.text.trim();
                              forgotPasswordController.forgotPassword(email);
                            }
                          },
                          child: Text(
                            'Forgot',
                            style: TextStyle(color: AppConst.appTextColor),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
