import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:next_cart/screens/auth_ui/welcome_screen.dart';
import 'package:next_cart/utils/app_constant_class.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        backgroundColor: AppConst.appSecondaryColor,
        child: Wrap(
          runSpacing: 10.0,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Waris',
                  style: TextStyle(color: AppConst.appTextColor),
                ),
                subtitle: Text('Version'),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppConst.appMainColor,
                  child: Text(
                    'w',
                    style: TextStyle(color: AppConst.appTextColor),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Home',
                  style: TextStyle(color: AppConst.appTextColor),
                ),
                leading: Icon(
                  Icons.home,
                  color: AppConst.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppConst.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Products',
                  style: TextStyle(color: AppConst.appTextColor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: AppConst.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppConst.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Orders',
                  style: TextStyle(color: AppConst.appTextColor),
                ),
                leading: Icon(
                  Icons.shopping_cart_checkout,
                  color: AppConst.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppConst.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Contacts',
                  style: TextStyle(color: AppConst.appTextColor),
                ),
                leading: Icon(
                  Icons.help,
                  color: AppConst.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppConst.appTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  IconButton(
                      onPressed: () async {
                        GoogleSignIn googleSignIn = GoogleSignIn();
                        FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.signOut();
                        await googleSignIn.signOut();

                        Get.offAll(() => WelcomeScreen());
                      },
                      icon: Icon(
                        Icons.logout,
                        color: AppConst.appTextColor,
                      ));
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'LogOut',
                  style: TextStyle(color: AppConst.appTextColor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppConst.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppConst.appTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
