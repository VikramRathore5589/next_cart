import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/screens/auth_ui/welcome_screen.dart';
import 'package:next_cart/screens/user_panel/main_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(()=>WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.appMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Lottie.asset(
              'assets/images/Animation - 1735706732575.json',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                AppConst.appPoweredBy,
                style: TextStyle(
                    color: AppConst.appTextColor,
                    fontSize: 18,
                    letterSpacing: 0.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
