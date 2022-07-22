import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/widgets/my_text.dart';

class GenderButton extends StatelessWidget {
  final String gender;
  final String image;
  final VoidCallback callback;
  final Color fontColor;
  final FontWeight fontWeight;
  final BoxDecoration boxDecoration;
  const GenderButton({
    Key? key,
    required this.gender,
    required this.image,
    required this.callback,
    required this.fontColor,
    required this.fontWeight,
    required this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          callback();
        },
        child: Container(
          decoration: boxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/$image.png',
                width: 90.w,
                height: 90.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              MyText(
                text: gender,
                fontSize: 17,
                fontWeight: fontWeight,
                color: fontColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
