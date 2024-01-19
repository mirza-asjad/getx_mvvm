import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/color/color.dart';
import 'package:getx_mvvm/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashService = SplashServices();

  @override
  void initState() {
    super.initState();
    splashService.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryGreenColor,
        body: Center(
          child: Text('Learning Getx MVVM'),
        ),
      ),
    );
  }
}
