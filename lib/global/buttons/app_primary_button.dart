// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPrimaryButton extends StatelessWidget {
  double? height;
  final VoidCallback onTap;
  Widget? buttonText;
  double? width;
  Color? color;
  double? radius;
  AppPrimaryButton( this.onTap, this.buttonText,
      {Key? key, this.height,this.width, this.color, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 10.sp),
            color: color,
            gradient: color == null
                ? const LinearGradient(
                    colors: [Color(0xFF35867f), Color(0xFF1b4a5a)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)
                : null),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onTap,
          child: buttonText,
        ));
  }
}
