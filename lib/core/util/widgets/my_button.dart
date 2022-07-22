import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color buttonColor;
  final VoidCallback callback;
  final Color fontColor;
  final double fontSize;
  final double radius;

  const MyButton({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.height = 55,
    this.buttonColor = Colors.blue,
    required this.callback,
    this.fontColor = Colors.white,
    this.fontSize = 17,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        color: buttonColor,
        height: height.h,
        onPressed: () {callback();},
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize.sp,
          ),
        ),
      ),
    );
  }
}
