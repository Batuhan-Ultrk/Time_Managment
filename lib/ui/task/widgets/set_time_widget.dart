import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';

class SetTimeWidget extends ConsumerWidget {
  const SetTimeWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.fromSize(
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.green,
            onTap: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: ConstantsTask.time,
                  onChange: (newTime) {
                    ref.watch(taskTimeProvider.notifier).state = newTime;
                  },
                  is24HrFormat: true,
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset('assets/images/clock.png'),
                ref.watch(taskTimeProvider) ==
                        TimeOfDay.fromDateTime(
                          DateFormat('hh.mm').parse('00.00'),
                        )
                    ? Text(
                        ConstantsTask.taskAddTime,
                        style: ThemeDataCreate().textStyle3(),
                      )
                    : Text(
                        ref.watch(taskTimeProvider).format(context),
                        style: ThemeDataCreate().textStyle1(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
