import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/model/user_model/user_model.dart';

import 'package:getx_mvvm/repository/login_repo.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/util/utils.dart';
import 'package:getx_mvvm/view_model/user_preference/user_preferences.dart';

class LoginViewModel extends GetxController {
  final api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  UserPreferences userPreferences = UserPreferences();

  void loginApiCall() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    api.loginApi(data).then((value) {
      loading.value = false;
      userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
        Get.delete<LoginViewModel>();
        Get.toNamed(RouteName.homeScreen)!.then((value) => null);
      }).onError((error, stackTrace) {
        Utils.toastMessage('Save Error', error.toString());
      });
      Utils.toastMessage('Login', 'Login Successfully');
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      loading.value = false;
      Utils.toastMessage('Login', error.toString());
    });
  }
}
