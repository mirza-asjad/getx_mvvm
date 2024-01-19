import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/user_preference/user_preferences.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences.getUser().then((value) {
      if (value.token != null) {
        if (value.token!.isEmpty || value.token!.toString() == 'null') {
          Timer(const Duration(seconds: 1),
              () => Get.toNamed(RouteName.loginScreen));
        } else {
          Timer(const Duration(seconds: 1),
              () => Get.toNamed(RouteName.homeScreen));
        }
      } else {
        Timer(const Duration(seconds: 1),
            () => Get.toNamed(RouteName.loginScreen));
      }
    });
  }
}
