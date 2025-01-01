import 'package:flutter/cupertino.dart';

class HideKeyBoardUtil{
  static void hideKeyBoard(BuildContext context){
    FocusScopeNode currentFocus=FocusScope.of(context);
    if(!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }
}