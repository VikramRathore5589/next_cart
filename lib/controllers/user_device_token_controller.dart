import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class UserDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        print('token $deviceToken');
        update();
      }
    } catch (e) {
      Get.snackbar('Error', '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConst.appSecondaryColor,
          colorText: AppConst.appTextColor);
    }
  }
}
