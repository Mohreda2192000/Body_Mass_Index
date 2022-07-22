import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/views/bmi_calculator/presentation/pages/bmi_calculator_page.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>  const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: BIMCalculatorPage(),
      ),
    );
  }
}

