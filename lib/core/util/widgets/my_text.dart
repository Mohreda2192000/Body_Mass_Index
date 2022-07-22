import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  const MyText({Key? key,
    required this.text,
    this.fontSize=40,
    this.fontWeight=FontWeight.w700,
    this.color=Colors.black,
    this.textAlign=TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
