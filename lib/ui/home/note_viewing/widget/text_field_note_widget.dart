import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';


class TextFieldNoteWidget extends ConsumerStatefulWidget {
  const TextFieldNoteWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextFieldNoteWidgetState();
}

class _TextFieldNoteWidgetState extends ConsumerState<TextFieldNoteWidget> {
  bool _hasFocus = false;
  @override
  Widget build(BuildContext context) {
    var chosenTask = ref.watch(taskInkwellClickProvider);
    return Padding(
      padding: const PagePadding.allLow(),
      child: InkWell(
        onTap: () {
          setState(() {
            _hasFocus = true;
          });
        },
        child: _hasFocus
            ? TextField(
                textAlign: TextAlign.values[chosenTask.textAlign],
                textInputAction: TextInputAction.done,
                cursorColor: const Color.fromARGB(255, 4, 0, 36),
                decoration: const InputDecoration(
                  fillColor: Colors.white10,
                ),
                controller: TextEditingController(
                  text: chosenTask.nots,
                ),
                maxLines: null,
                minLines: 1,
                style: textStyle(chosenTask),
                onSubmitted: (text) {
                  ref.read(taskInkwellClickProvider.notifier).state =
                      TimeManagmentModel(
                    id: chosenTask.id,
                    header: chosenTask.header,
                    nots: text,
                    hour: chosenTask.hour,
                    date: chosenTask.date,
                    completed: chosenTask.completed,
                    textStyle: chosenTask.textStyle,
                    textAlign: chosenTask.textAlign,
                  );
                  setState(() {
                    _hasFocus = false;
                  });
                },
              )
            : chosenTask.nots == ""
                ? Text(
                    ConstantsTask.taskAddNote,
                    style: ThemeDataCreate().textStyle3(),
                  )
                : Text(
                    chosenTask.nots,
                    style: textStyle(chosenTask),
                    textAlign: TextAlign.values[chosenTask.textAlign],
                  ),
      ),
    );
  }

  TextStyle textStyle(TimeManagmentModel chosenTask) {
    return TextStyle(
      color: Color(int.parse(chosenTask.textStyle.colorValue.toString())),
      fontFamily: chosenTask.textStyle.fontFamily,
      fontSize: chosenTask.textStyle.fontSize,
      wordSpacing: chosenTask.textStyle.wordSpacing,
      decorationStyle: TextDecorationStyle
          .values[chosenTask.textStyle.decorationStyleIndex ?? 0],
      decorationColor: Color(
        chosenTask.textStyle.decorationColorValue ?? 000000,
      ),
      decorationThickness: chosenTask.textStyle.decorationThickness,
      fontWeight: FontWeight.values[chosenTask.textStyle.fontWeightIndex ?? 0],
      letterSpacing: chosenTask.textStyle.letterSpacing,
      height: chosenTask.textStyle.height,
      backgroundColor: Color(
        int.parse(
          chosenTask.textStyle.backgroundColorValue.toString(),
        ),
      ),
      fontStyle: FontStyle.values[chosenTask.textStyle.fontStyle ?? 0],
    );
  }
}
