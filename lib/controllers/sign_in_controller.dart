import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:next_cart/models/user_model.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SignInController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isPasswordVisible = false.obs;

//TODO: signUp function
  Future<UserCredential?> signIn(String userEmail, String userPassword) async {
    try {
      EasyLoading.show(status: 'Please wait');
      //TODO: create a user with username or password
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);

      EasyLoading.dismiss();
      return credential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      Get.snackbar('Error', '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConst.appSecondaryColor,
          colorText: AppConst.appTextColor);
    }
  }
}
