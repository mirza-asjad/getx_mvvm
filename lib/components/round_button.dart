import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/color/color.dart';

class RoundButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String title;
  final double width;
  final double height;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      this.buttonColor = AppColors.primaryGreenColor,
      this.textColor = AppColors.primaryRedColor,
      required this.title,
      required this.onPressed,
      this.width = 200,
      this.height = 60,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                    title,
                  ),
                )),
    );
  }
}
