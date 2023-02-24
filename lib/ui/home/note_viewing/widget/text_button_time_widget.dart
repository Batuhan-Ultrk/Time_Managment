import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';


class TextButtonTimeWidget extends ConsumerWidget {
  const TextButtonTimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chosenTask = ref.watch(taskInkwellClickProvider);
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).push(
          showPicker(
            context: context,
            value: ConstantsTask.time,
            onChange: (newTime) {
              ref.read(taskInkwellClickProvider.notifier).state =
                  TimeManagmentModel(
                id: chosenTask.id,
                header: chosenTask.header,
                nots: chosenTask.nots,
                hour: newTime.format(context),
                date: chosenTask.date,
                completed: chosenTask.completed,
                textStyle: chosenTask.textStyle,
                textAlign: chosenTask.textAlign,
              );
            },
            is24HrFormat: true,
          ),
        );
      },
      icon: const Icon(
        Icons.access_time_rounded,
        color: Colors.black,
      ),
      label: Text(
        chosenTask.hour,
        style: ThemeDataCreate().textStyle3(),
      ),
    );
  }
}
