import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/task/editor/view/editor.dart';


class CreatingNote extends ConsumerWidget {
  const CreatingNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      icon: const Icon(
        Icons.note_alt_sharp,
        size: 40,
        color: Color.fromARGB(255, 18, 19, 49),
      ),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const Editor(),
          ),
        );
      },
      label: ref.watch(editorNoteProvider) == ""
          ? Text(
              ConstantsTask.taskAddNote,
              style: ThemeDataCreate().textStyle2(),
            )
          : TextScroll(
              ref.watch(editorNoteProvider),
              mode: TextScrollMode.endless,
              pauseBetween: const Duration(milliseconds: 1000),
              velocity: const Velocity(pixelsPerSecond: Offset(70, 0)),
              style: ThemeDataCreate().textStyle2(),
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              selectable: true,
            ),
    );
  }
}
