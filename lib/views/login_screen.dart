// ignore_for_file: unused_field, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/components/round_button.dart';

import 'package:getx_mvvm/view_model/controller/login_view_model.dart';
import 'package:getx_mvvm/widgets/loginEmail_widget.dart';
import 'package:getx_mvvm/widgets/loginPassword_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();
  bool checkobscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Getx MVVM'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      InputEmailWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      InputPasswordWidget(checkobscureText: checkobscureText)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return RoundButton(
                    title: 'Login',
                    loading: loginVM.loading.value,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        loginVM.loginApiCall();
                      }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
