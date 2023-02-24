import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/providers/all_providers.dart';

class TextFieldEditorHeaderWidget extends ConsumerWidget {
  const TextFieldEditorHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: TextEditingController(
        text: ref.read(editorHeaderProvider),
      ),
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        label: Text(
          ConstantsEditor.hintTextHeader,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      onChanged: (value) {
        ref.read(editorHeaderProvider.notifier).state = value;
      },
    );
  }
}
