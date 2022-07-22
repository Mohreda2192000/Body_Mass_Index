import 'package:flutter/material.dart';

import '../widgets/bmi_result_widget.dart';

class BMIResultPage extends StatelessWidget {
  final double BMI;
  final int index;
  const BMIResultPage({Key? key,
    required this.BMI,
    required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xEEEEEEFF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: Colors.grey,),
        ),
        title: const Text('BIM Calculator',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      body: BMIResultWidget(BMI: BMI,index:index),
    );
  }
}
