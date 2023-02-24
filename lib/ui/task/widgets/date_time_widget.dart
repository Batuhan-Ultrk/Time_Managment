import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/providers/all_providers.dart';




class DateTimeLineWidget extends ConsumerWidget {
  const DateTimeLineWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.black,
      selectedTextColor: Colors.white,
      onDateChange: (date) {
        ref.read(taskDateProvider.notifier).state = date;
      },
    );
  }
}
