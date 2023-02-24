import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/core/services/hive_managment_manager.dart';
import 'package:time_managment/core/services/notification_managment_manager.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/home/note_viewing/view/note_viewing.dart';


class TaskCreateWidget extends ConsumerStatefulWidget {
  const TaskCreateWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskCreateWidgetState();
}

class _TaskCreateWidgetState extends ConsumerState<TaskCreateWidget> {
  @override
  Widget build(BuildContext context) {
    final currentTaskItem = ref.watch(currentTaskProvider);

    return InkWell(
      onTap: () {
        ref.read(taskInkwellClickProvider.notifier).state = currentTaskItem;
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const NoteViewing(),
          ),
        );
      },
      child: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              color: Color.fromARGB(166, 9, 8, 49),
            ),
            Text(
              DateFormat("dd/MM/yyyy").format(
                currentTaskItem.date,
              ),
              style: ThemeDataCreate().textStyle3(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: ThemeDataCreate().boxDecoration(),
                  child: Center(
                    child: Padding(
                      padding: const PagePadding.allLow(),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          currentTaskItem.hour,
                          style: ThemeDataCreate().textStyle2(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const PagePadding.onlyPadding(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2.1,
                    ),
                    child: TextScroll(
                      currentTaskItem.header,
                      mode: TextScrollMode.endless,
                      pauseBetween: const Duration(milliseconds: 1000),
                      velocity: const Velocity(pixelsPerSecond: Offset(70, 0)),
                      style: ThemeDataCreate().textStyle3(),
                      textAlign: TextAlign.left,
                      selectable: true,
                    ),
                  ),
                ),
                Checkbox(
                  value: currentTaskItem.completed,
                  onChanged: (check) {
                    check!
                        ? NotificationManagmentManager.notificationCancel(
                            currentTaskItem.id,
                          )
                        : notificationAdd(currentTaskItem);
                    ref.read(currentTaskProvider).completed = check;
                    HiveManagmentManager().updateTask(ref, currentTaskItem);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  notificationAdd(TimeManagmentModel currentTaskItem) {
    ref.read(taskDateProvider.notifier).state = currentTaskItem.date;
    ref.read(taskTimeProvider.notifier).state = TimeOfDay(
      hour: int.parse(currentTaskItem.hour.split(":")[0]),
      minute: int.parse(currentTaskItem.hour.split(":")[1]),
    );
    NotificationManagmentManager.notificationAdd(
      ref,
      context,
      currentTaskItem.id,
    );
  }
}
