import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/color/color.dart';

class Utils {
  static void fieldfocusNode(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  static void toastMessage(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.primaryRedColor);
  }
}
