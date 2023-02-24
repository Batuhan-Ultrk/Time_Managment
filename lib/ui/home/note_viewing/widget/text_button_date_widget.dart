import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';


class TextButtonDateWidget extends ConsumerWidget {
  const TextButtonDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chosenTask = ref.watch(taskInkwellClickProvider);
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(184, 83, 114, 112),
              actions: [
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    ref.read(taskInkwellClickProvider.notifier).state =
                        TimeManagmentModel(
                      id: chosenTask.id,
                      header: chosenTask.header,
                      nots: chosenTask.nots,
                      hour: chosenTask.hour,
                      date: date,
                      completed: chosenTask.completed,
                      textStyle: chosenTask.textStyle,
                      textAlign: chosenTask.textAlign,
                    );
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.calendar_month_outlined,
        color: Colors.black,
      ),
      label: Text(
        DateFormat("dd/MM/yyyy").format(chosenTask.date),
        style: ThemeDataCreate().textStyle3(),
      ),
    );
  }
}
