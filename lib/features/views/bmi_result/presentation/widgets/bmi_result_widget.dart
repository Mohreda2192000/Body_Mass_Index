import 'package:bmi_calculator/core/util/widgets/my_button.dart';
import 'package:bmi_calculator/core/util/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bmi_calculator/presentation/pages/bmi_calculator_page.dart';

// ignore: must_be_immutable
class BMIResultWidget extends StatelessWidget {
  final double BMI;
  final int index;
   BMIResultWidget({Key? key,
    required this.BMI,
     required this.index,
  }) : super(key: key);
  List<Color> colors=[
    Colors.amberAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.redAccent,
  ];
  List<String> names=[
    'Underweight',
    'Normal',
    'Overweight',
    'Obese',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 20.w,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyText(
            text: 'Your Result',
            color: Color(0xff7776fe),
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 20.w,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: Color(0xEEEEEEFF),
            ),
            child: Column(
              children: [
                 MyText(
                  text: names[index],
                  color: colors[index],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                 MyText(
                  text: BMI.toStringAsFixed(1),
                  color: const Color(0xff7776fe),
                  fontWeight: FontWeight.bold,
                ),
                const MyText(
                  text: 'kg/m2',
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                Slider(
                  value: BMI,
                  divisions: 4,
                  max: 200.0,
                  min: 1.0,
                  onChanged: (value) {
                  },
                  activeColor: colors[index],
                  inactiveColor: Colors.grey,
                ),
                MyButton(
                  callback: () {  },
                  text: 'Save Result',
                  buttonColor: Color(0xff7776fe),
                radius: 20,
                  height: 40,
                ),

              ],
            ),
          ),
          SizedBox(height: 20.h,),
          const MyText(
            text: 'Your Result Your ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour ResultYour Result',
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          const Spacer(),
          MyButton(
            callback: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BIMCalculatorPage(),
                ),
              );
            },
            text: 'Reset Calculate BMI',
            buttonColor: const Color(0xff7776fe),
            radius: 20,
            height: 40,
          ),
        ],
      ),
    );
  }
}
