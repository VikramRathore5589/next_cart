import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/controllers/get_user_data_controller.dart';
import 'package:next_cart/controllers/sign_in_controller.dart';
import 'package:next_cart/screens/admin_panel/admin_main_screen.dart';
import 'package:next_cart/screens/auth_ui/forgot_password_screen.dart';
import 'package:next_cart/screens/auth_ui/sign_up_screen.dart';
import 'package:next_cart/screens/user_panel/main_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisibility) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppConst.appMainColor,
            title: Text(
              'Sign In',
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
                      Obx(
                        () => TextFormField(
                          obscureText: signInController.isPasswordVisible.value,
                          controller: userPassword,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap:
                                      signInController.isPasswordVisible.toggle,
                                  child:
                                      signInController.isPasswordVisible.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                              prefixIcon: Icon(Icons.password),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotPasswordScreen());
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: AppConst.appMainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppConst.appMainColor),
                          onPressed: () async {
                            String email = userEmail.text.trim();
                            String password = userPassword.text.trim();
                            if (email.isEmpty || password.isEmpty) {
                              Get.snackbar('Error', 'Please enter all detail');
                            } else {
                              UserCredential? credential =
                                  await signInController.signIn(
                                      email, password);
                              var userData = await getUserDataController
                                  .getUserData(credential!.user!.uid);
                              if (credential != null) {
                                if (credential.user!.emailVerified) {
                                  if (userData[0]['isAdmin'] == true) {
                                    Get.snackbar('Success Admin login',
                                        'Admin Logged In Successfully',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            AppConst.appSecondaryColor,
                                        colorText: AppConst.appTextColor);
                                    Get.offAll(() => AdminMainScreen());
                                  } else {
                                    Get.snackbar('Success User login',
                                        'Logged In Successfully',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            AppConst.appSecondaryColor,
                                        colorText: AppConst.appTextColor);
                                    Get.offAll(() => MainScreen());

                                  }

                                } else {
                                  Get.snackbar('Error',
                                      'Please verify your email before login',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          AppConst.appSecondaryColor,
                                      colorText: AppConst.appTextColor);
                                }
                              } else {
                                Get.snackbar('Error', 'Please try Again',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: AppConst.appSecondaryColor,
                                    colorText: AppConst.appTextColor);
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: AppConst.appTextColor),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont't have an Account ?",
                            style: TextStyle(
                                color: AppConst.appMainColor,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offAll(() => SignUpScreen());
                              },
                              child: Text('Sign Up'))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
