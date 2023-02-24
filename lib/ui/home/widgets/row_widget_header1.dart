import 'package:flutter/material.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';




class RowWidgetHeader1 extends StatelessWidget {
  const RowWidgetHeader1({super.key});
  final header1 = "günaydin Rümüş";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          header1,
          style: ThemeDataCreate().textStyle1(),
        ),
      ],
    );
  }
}
