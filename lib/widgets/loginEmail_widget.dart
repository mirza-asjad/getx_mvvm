import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/util/utils.dart';
import 'package:getx_mvvm/view_model/controller/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter the Email',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          Utils.toastMessage('Email', 'Enter Email');
        } else if (!Utils.isEmailValid(value)) {
          Utils.toastMessage('Email', 'Email Format Not Correct');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldfocusNode(
          context,
          loginVM.emailFocusNode.value,
          loginVM.passwordFocusNode.value,
        );
      },
    );
  }
}
