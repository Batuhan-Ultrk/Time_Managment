import 'package:flutter/material.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';




class RowWidgetHeader2 extends StatelessWidget {
  const RowWidgetHeader2({super.key});
  final header2 = "işte bugün yapilacaklar listen";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          header2,
          style: ThemeDataCreate().textStyle3(),
        ),
      ],
    );
  }
}
