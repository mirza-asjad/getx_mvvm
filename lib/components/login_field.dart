import 'package:flutter/material.dart';

class ReuseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;
  final FocusNode? focusNode;
  final void Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onEditingComplete;

  const ReuseTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.hintText = 'Enter the Text',
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black, // Set your desired text color
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey, // Set your desired hint text color
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        errorText: errorText,
        errorStyle: const TextStyle(
          color: Colors.red, // Set your desired error text color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context)
                .primaryColor, // Use the primary color of your theme
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey[400]!, // Set your desired border color
            width: 1.0,
          ),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
    );
  }
}
