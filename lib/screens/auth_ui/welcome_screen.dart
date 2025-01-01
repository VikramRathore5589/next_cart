import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            color: AppConst.appMainColor,
            height: Get.height * .5,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  " Welcome to ${AppConst.appName}",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppConst.appTextColor,
                  ),
                ),
                SizedBox(
                  height: Get.height * .1,
                ),
                Lottie.asset('assets/images/Animation - 1735706732575.json')
              ],
            ),
          ),
          Text(
            'Happy Shopping',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          ),
          SizedBox(
            height: Get.height * .1,
          ),
          buildButtons(mq, Image.asset('assets/images/google.png'),
              'Sign In With Google'),
          buildButtons(mq, Image.asset('assets/images/email-logo.jpg'),
              'Sign In With Gmail')
        ],
      ),
    );
  }

  Padding buildButtons(Size mq, Image image, String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: mq.height * 0.07,
        decoration: BoxDecoration(
            color: AppConst.appMainColor,
            borderRadius: BorderRadius.circular(15)),
        child: IconButton(
            onPressed: () {},
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image,
                SizedBox(
                  width: 8,
                ),
                Text(
                  text,
                  style: TextStyle(color: AppConst.appTextColor, fontSize: 17),
                )
              ],
            )),
      ),
    );
  }
}
