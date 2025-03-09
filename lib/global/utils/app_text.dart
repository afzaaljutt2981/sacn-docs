
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_docs/global/utils/app_text_styles.dart';

class AppText extends StatelessWidget {
  AppText(this.text, this.fontSize, this.fontWeight, this.color,
      {super.key, this.textAlign});
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppTextStyles.poppins(
          style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      )),
    );
  }
}