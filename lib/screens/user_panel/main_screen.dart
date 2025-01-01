import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.appMainColor,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConst.appSecondaryColor,
            statusBarIconBrightness: Brightness.light),
        title: Text(AppConst.appName),
      ),
    );
  }
}
