import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:next_cart/screens/auth_ui/sign_in_screen.dart';

import '../utils/app_constant_class.dart';

class ForgotPasswordController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> isEmailRegistered(String userEmail) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking email: $e');
      return false;
    }
  }

  Future<void> forgotPassword(String userEmail) async {
    try {
      EasyLoading.show(status: 'Please wait...');

      bool emailExists = await isEmailRegistered(userEmail);

      if (emailExists) {
        await _auth.sendPasswordResetEmail(email: userEmail);
        Get.snackbar(
          'Password reset request sent Successfully',
          'Password reset link sent to $userEmail',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConst.appSecondaryColor,
          colorText: AppConst.appTextColor,
        );
        Get.offAll(() => SignInScreen());
      } else {
        Get.snackbar(
          'Error',
          'The email address is not registered.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConst.appSecondaryColor,
          colorText: AppConst.appTextColor,
        );
      }

      EasyLoading.dismiss();
    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConst.appSecondaryColor,
        colorText: AppConst.appTextColor,
      );
    }
  }
}
