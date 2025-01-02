import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:next_cart/controllers/user_device_token_controller.dart';
import 'package:next_cart/models/user_model.dart';
import 'package:next_cart/screens/user_panel/main_screen.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithGoogle() async {
    final UserDeviceTokenController userDeviceTokenController = Get.put(
        UserDeviceTokenController());
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        EasyLoading.show(status: 'Please wait...');
        final GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: authentication.accessToken,
            idToken: authentication.idToken);
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          UserModel userModel = UserModel(
              uid: user.uid,
              username: user.displayName.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImg: user.photoURL.toString(),
              userDeviceToken: userDeviceTokenController.deviceToken.toString(),
              country: '',
              userAddress: '',
              street: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now(),
              city: '');
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toJson());
          EasyLoading.dismiss();
          await Get.offAll(() => MainScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();

      print('$e');
    }
  }
}
