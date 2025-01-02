import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:next_cart/screens/auth_ui/welcome_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';
import 'package:next_cart/widgets/custom_drawer_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConst.appTextColor),
        backgroundColor: AppConst.appMainColor,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConst.appSecondaryColor,
            statusBarIconBrightness: Brightness.light),
        title: Text(
          AppConst.appName,
          style: TextStyle(color: AppConst.appTextColor),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
