import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/screens/auth_ui/sign_up_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          body: Column(
            children: [
              Container(
                color: AppConst.appMainColor,
                width: double.infinity,
                height: Get.height * .4,
                child: Lottie.asset(
                  'assets/images/Animation - 1735706732575.json',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.visibility_off),
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
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
                              Get.offAll(() =>SignUpScreen());
                            },
                            child: Text('Sign Up'))
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
    });
  }
}
