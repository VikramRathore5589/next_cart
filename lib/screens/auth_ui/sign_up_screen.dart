import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/controllers/google_sign_in_controller.dart';
import 'package:next_cart/controllers/sign_up_controller.dart';
import 'package:next_cart/screens/auth_ui/sign_in_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final passwordController = TextEditingController();
  final SignUpController signInController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConst.appMainColor,
          title: Text(
            'Sign Up',
            style: TextStyle(color: AppConst.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              children: [
                Text(
                  'Welcome to my App',
                  style: TextStyle(color: AppConst.appMainColor, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //TODo: in future modify obsecuretext in correct way
                        buildTextFormField('Email', Icons.email,
                            TextInputType.emailAddress, emailController, false),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField('UserName', Icons.person,
                            TextInputType.text, nameController, false),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField('Phone', Icons.email,
                            TextInputType.phone, phoneController, false),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField('City', Icons.location_on_outlined,
                            TextInputType.streetAddress, cityController, false),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => buildTextFormField(
                              suffixIcon:
                                  signInController.isPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                              'Password',
                              Icons.password,
                              TextInputType.text,
                              passwordController,
                              signInController.isPasswordVisible.value,
                              onSuffixIconPressed: () {
                            signInController.isPasswordVisible.toggle();
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: AppConst.appMainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppConst.appMainColor),
                            onPressed: () async {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String phone = phoneController.text.trim();
                              String city = cityController.text.trim();
                              String password = passwordController.text.trim();
                              String userDeviceToken = '';
                              if (name.isEmpty ||
                                  email.isEmpty ||
                                  phone.isEmpty ||
                                  city.isEmpty ||
                                  password.isEmpty) {
                                Get.snackbar('Error', 'Please fill all field ',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: AppConst.appSecondaryColor,
                                    colorText: AppConst.appTextColor);
                              } else {
                                UserCredential? userCredential =
                                    await signInController.signUp(name, email,
                                        phone, city, password, userDeviceToken);
                                if (userCredential != null) {
                                  Get.snackbar('Verification email sent',
                                      'Please check your email',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          AppConst.appSecondaryColor,
                                      colorText: AppConst.appTextColor);
                                  FirebaseAuth.instance.signOut();
                                  Get.offAll(() => SignInScreen());
                                }
                              }
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: AppConst.appTextColor),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account ?",
                              style: TextStyle(
                                  color: AppConst.appMainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.offAll(() => SignInScreen());
                                },
                                child: Text('Sign In'))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  TextFormField buildTextFormField(String hintText, IconData prefixIcon,
      TextInputType inputType, TextEditingController controller, bool obSecure,
      {IconData? suffixIcon, Function()? onSuffixIconPressed}) {
    return TextFormField(
      obscureText: obSecure,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixIconPressed,
                  // Trigger the function when the icon is tapped
                  child: Icon(suffixIcon),
                )
              : null,
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
