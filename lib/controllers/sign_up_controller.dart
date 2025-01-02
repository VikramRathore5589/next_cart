import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:next_cart/models/user_model.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class SignUpController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isPasswordVisible = false.obs;

//TODO: signUp function
  Future<UserCredential?> signUp(
    String username,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'Please wait');
      //TODO: create a user with username or password
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      //TODO: sent email verification message to user to verify userEmail
      await credential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
          uid: credential.user!.uid,
          username: username,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity);
      //TODO:add data to firebase database
      _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(userModel.toJson());
      EasyLoading.dismiss();
      return credential;
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConst.appSecondaryColor,
          colorText: AppConst.appTextColor);
    }
  }
}
