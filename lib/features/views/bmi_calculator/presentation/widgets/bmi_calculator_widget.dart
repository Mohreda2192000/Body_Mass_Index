import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/widgets/my_button.dart';
import '../../../../../core/util/widgets/my_text.dart';
import '../../../bmi_result/presentation/pages/bmi_result_page.dart';
import 'age_or_weight.dart';
import 'gender_button.dart';


class BIMCalculatorWidget extends StatefulWidget {
  const BIMCalculatorWidget({Key? key}) : super(key: key);

  @override
  State<BIMCalculatorWidget> createState() => _BIMCalculatorWidgetState();
}

class _BIMCalculatorWidgetState extends State<BIMCalculatorWidget> {
  static const Color color=Color(0xEEEEEEFF);
  Color fontColorMale=Colors.black;
  Color fontColorFemale=Colors.grey;
  Color backColorMale=const Color(0xff7776fe);
  Color backColorFemale=color;
  FontWeight fontWeightMale=FontWeight.bold;
  FontWeight fontWeightFemale=FontWeight.w400;
  double valueSlider=120;
  int age=22;
  int weight=72;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 10.h,
        ),
        const MyText(
          text: 'Body mass index (BMI)',
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Colors.black45,
        ),
        //  Row contain Two Gender Buttons  ( to choice male or female )
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                GenderButton(
                  gender: 'MALE',
                  image: 'male',
                  callback: (){
                     fontColorMale=Colors.black;
                     fontColorFemale=Colors.grey;
                     backColorMale=const Color(0xff7776fe);
                     backColorFemale=color;
                     fontWeightMale=FontWeight.bold;
                     fontWeightFemale=FontWeight.w400;
                     setState(() {  });
                  },
                  boxDecoration: boxDecoration(backColorMale,10),
                  fontColor: fontColorMale,
                  fontWeight: fontWeightMale,
                ),
                SizedBox(
                  width: 20.w,
                ),
                GenderButton(
                  gender: 'FEMALE',
                  image: 'female',
                  callback: (){
                    fontColorFemale=Colors.black;
                    fontColorMale=Colors.grey;
                    backColorFemale=const Color(0xff7776fe);
                    backColorMale=color;
                    fontWeightFemale=FontWeight.bold;
                    fontWeightMale=FontWeight.w400;
                    setState(() {  });
                  },
                  fontColor: fontColorFemale,
                  fontWeight: fontWeightFemale,
                  boxDecoration: boxDecoration(backColorFemale,10),
                ),
              ],
            ),
          ),
        ),
        //  Slider to choice height
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration:boxDecoration(color,10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const MyText(
                    text: 'HEIGHT',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      MyText(
                        text: '${double.parse((valueSlider).toStringAsFixed(1))}',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 5.w,),
                      const MyText(
                        text: 'cm',
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Slider(
                    value: valueSlider,
                    max: 220.0,
                    min: 20.0,
                    onChanged: (value) {
                      valueSlider=value;
                      setState((){});
                    },
                    activeColor: const Color(0xff7776fe),
                    inactiveColor: Colors.grey,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        //  Row contain Two AgeOrWeight  ( to choice age and weight )
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                AgeOrWeight(
                  callbackIncrement: (){setState((){age++;}); },
                  callbackDecrement: (){setState((){age--;});},
                  text: 'age',
                  value: age,
                  boxDecoration:boxDecoration(color,10),
                  unit: 'year',
                ),
                SizedBox(width: 20.w,),
                AgeOrWeight(
                  callbackIncrement: (){ setState((){weight++;});},
                  callbackDecrement: (){setState((){weight--; });},
                  text: 'weight',
                  value: weight,
                  boxDecoration:boxDecoration(color,10),
                  unit: 'kg',
                ),
              ],
            ),
          ),
        ),
        // Button to Calculate result of BMI
        Padding(
          padding: EdgeInsets.only(
            top: 0,
            right: 50.h,
            left: 50.h,
            bottom: 10.h,
          ),
          child: MyButton(
            text: 'Calculate',
            callback: () {
              double BMI =weight/pow(valueSlider/100,2);
              int index=0;
              if(BMI<=18.4) {
                index=0;
              } else if(BMI>18.4&&BMI<=24.9) {
                index=1;
              } else if(BMI>24.9&&BMI<=39.9) {
                index=2;
              } else {
                index=3;
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIResultPage(BMI: BMI,index:index),
                ),
              );
            },
            buttonColor: const Color(0xff7776fe),
            height: 40,
            radius: 30,
          ),
        ),
      ],
    );
  }

  BoxDecoration boxDecoration(Color color,double radius)=>BoxDecoration(
    borderRadius: BorderRadius.circular(
      10.0,
    ),
    color: color,
  );
}
