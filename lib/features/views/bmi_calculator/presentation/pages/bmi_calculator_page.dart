import 'package:flutter/material.dart';

import '../../../../../core/util/components/navigation_drawer_widget.dart';
import '../widgets/bmi_calculator_widget.dart';

class BIMCalculatorPage extends StatelessWidget {
  const BIMCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xEEEEEEFF),
        elevation: 0,
        title: const Text('BIM Calculator',
        style: TextStyle(
          color: Colors.grey,
        ),
        ),
        centerTitle: true,
      ),
      body:  const BIMCalculatorWidget(),
    );
  }
}
