// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_model/controller/login_view_model.dart';

class InputPasswordWidget extends StatefulWidget {
  bool checkobscureText;
  InputPasswordWidget({super.key,required this.checkobscureText});

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.passwordController.value,
      obscureText: widget.checkobscureText,
      focusNode: loginVM.passwordFocusNode.value,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter the Password',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.checkobscureText = !widget.checkobscureText;
              });
            },
            child: widget.checkobscureText
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off)),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
