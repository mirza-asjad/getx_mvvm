import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/views/home_screen.dart';
import 'package:getx_mvvm/views/login_screen.dart';
import 'package:getx_mvvm/views/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
        GetPage(name: RouteName.loginScreen, page: () => const LoginScreen()),
        GetPage(name: RouteName.homeScreen, page: () => const HomeScreen()),
      ];
}
