import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/models/text_style/serializable_text_style_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';

class TextFieldEditorNoteWidget extends ConsumerStatefulWidget {
  const TextFieldEditorNoteWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextFieldEditorNoteWidgetState();
}

class _TextFieldEditorNoteWidgetState
    extends ConsumerState<TextFieldEditorNoteWidget> {
  @override
  Widget build(BuildContext context) {
    var s = ref.read(editorNoteProvider);
    TextEditingController textEditingController = TextEditingController(
      text: s,
    );
    FocusNode focusNode = FocusNode();
    var textStyleProvider = ref.watch(editorTextStyleProvider);
    var textAlignProvider = ref.watch(editorTextAlignProvider);
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(focusNode)),
      child: TextField(
        autofocus: false,
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.values[textAlignProvider],
        controller: textEditingController,
        onChanged: (value) {
          ref.read(editorNoteProvider.notifier).state = value;
        },
        onSubmitted: (value) {
          ref.read(editorNoteProvider.notifier).state = value;
        },
        style: textStyle(textStyleProvider),
        maxLines: null,
        minLines: 1,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          hintText: ConstantsEditor.hintTextBody,
        ),
      ),
    );
  }

  TextStyle textStyle(SerializableTextStyleModel textStyleProvider) {
    return TextStyle(
      color: Color(int.parse(textStyleProvider.colorValue.toString())),
      fontFamily: textStyleProvider.fontFamily,
      fontSize: textStyleProvider.fontSize,
      wordSpacing: textStyleProvider.wordSpacing,
      decorationStyle: TextDecorationStyle
          .values[textStyleProvider.decorationStyleIndex ?? 0],
      decorationColor: Color(
        textStyleProvider.decorationColorValue ?? 000000,
      ),
      decorationThickness: textStyleProvider.decorationThickness,
      fontWeight: FontWeight.values[textStyleProvider.fontWeightIndex ?? 0],
      letterSpacing: textStyleProvider.letterSpacing,
      height: textStyleProvider.height,
      backgroundColor: Color(
        int.parse(
          textStyleProvider.backgroundColorValue.toString(),
        ),
      ),
      fontStyle: FontStyle.values[textStyleProvider.fontStyle ?? 0],
    );
  }
}
