import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/widgets/my_text.dart';

class AgeOrWeight extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final String text;
  final int value;
  final VoidCallback callbackIncrement;
  final VoidCallback callbackDecrement;
  final String  unit;
  const AgeOrWeight(
      {Key? key,
        required this.boxDecoration,
        required this.text,
        required this.value,
        required this.callbackIncrement,
        required this.callbackDecrement,
        required this.unit,
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: boxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            MyText(
              text: text,
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
                  text: '$value',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                SizedBox(
                  width: 5.w,
                ),
                MyText(
                  text: unit,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                FloatingActionButton.small(
                  onPressed: () {
                    callbackIncrement();
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.grey,),
                ),
                const Spacer(),
                FloatingActionButton.small(
                  onPressed: () {
                    callbackDecrement();
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.remove, color: Colors.grey,),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    )
    ;
  }
}
