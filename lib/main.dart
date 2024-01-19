import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/localization/languages.dart';
import 'package:getx_mvvm/res/routes/routes.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: 'Getx_MVVM',
      initialRoute: RouteName.splashScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
