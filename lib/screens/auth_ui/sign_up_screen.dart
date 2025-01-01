import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/screens/auth_ui/sign_in_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                        buildTextFormField(
                            'Email', Icons.email, TextInputType.emailAddress),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            'UserName', Icons.person, TextInputType.text),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            'Phone', Icons.email, TextInputType.phone),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField('City', Icons.location_on_outlined,
                            TextInputType.streetAddress),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                            'Password', Icons.password, TextInputType.text),
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
                            onPressed: () {},
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

  TextFormField buildTextFormField(
      String hintText, IconData prefixIcon, TextInputType inputType) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
