import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';

class ConstrainedBoxWidget extends ConsumerStatefulWidget {
  const ConstrainedBoxWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConstrainedBoxWidgetState();
}

class _ConstrainedBoxWidgetState extends ConsumerState<ConstrainedBoxWidget> {
  bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    var chosenTask = ref.watch(taskInkwellClickProvider);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 1.4,
      ),
      child: hasFocus
          ? TextField(
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                fillColor: Colors.white10,
              ),
              controller: TextEditingController(
                text: ref.read(taskInkwellClickProvider.notifier).state.header,
              ),
              /*style: TextStyle(
                color: Color(int.parse(chosenTask.textStyle.color)),
                fontSize: chosenTask.textStyle.fontSize,
                fontFamily: chosenTask.textStyle.fontFamily,
              ),*/
              onSubmitted: (title) {
                ref.read(taskInkwellClickProvider.notifier).state =
                    TimeManagmentModel(
                  id: chosenTask.id,
                  header: title,
                  nots: chosenTask.nots,
                  hour: chosenTask.hour,
                  date: chosenTask.date,
                  completed: chosenTask.completed,
                  textStyle: chosenTask.textStyle,
                  textAlign: chosenTask.textAlign,
                );
                setState(() {
                  hasFocus = false;
                });
              },
            )
          : TextButton.icon(
              onPressed: (() {
                setState(() {
                  hasFocus = true;
                });
              }),
              icon: const Icon(
                Icons.title_rounded,
                color: Colors.black,
              ),
              label: TextScroll(
                chosenTask.header,
                mode: TextScrollMode.endless,
                pauseBetween: const Duration(milliseconds: 1000),
                velocity: const Velocity(pixelsPerSecond: Offset(70, 0)),
                style: ThemeDataCreate().textStyle3(),
                textAlign: TextAlign.left,
                selectable: true,
              ),
            ),
    );
  }
}
