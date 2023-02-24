import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_style_editor/text_style_editor.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/models/text_style/serializable_text_style_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/task/editor/widgets/text_field_editor_header_widget.dart';
import 'package:time_managment/ui/task/editor/widgets/text_field_editor_note_widget.dart';

class Editor extends ConsumerStatefulWidget {
  const Editor({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorState();
}

class _EditorState extends ConsumerState<Editor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeDataCreate.boxDecorationLinearGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomTextEditor(ref),
        appBar: AppBar(
          leading: ConstantsAppbar.appBarLeadingIcon(
            context,
            () {
              Navigator.pop(context);
            },
          ),
          title: ConstantsAppbar.appBarTitleText(),
        ),
        body: ListView(
          children: [
            Column(
              children: const [
                Padding(
                  padding: PagePadding.allMiddle(),
                  child: TextFieldEditorHeaderWidget(),
                ),
                Padding(
                  padding: PagePadding.allLow(),
                  child: TextFieldEditorNoteWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyleEditor bottomTextEditor(WidgetRef ref) {
    var textStyleProvider = ref.read(editorTextStyleProvider);
    var textAlignProvider = ref.watch(editorTextAlignProvider);
    return TextStyleEditor(
      textStyle: textStyle(textStyleProvider),
      fonts: ConstantsEditor.fonts,
      textAlign: TextAlign.values[textAlignProvider],
      paletteColors: ConstantsEditor.paletteColors,
      onTextAlignEdited: (align) {
        ref.read(editorTextAlignProvider.notifier).state = align.index;
      },
      onTextStyleEdited: (textStyle) {
        ref.read(editorTextStyleProvider.notifier).addTextStyle(
              SerializableTextStyleModel(
                backgroundColorValue:
                    textStyle.backgroundColor?.value ?? 0x0000ffff,
                height: textStyle.height,
                fontSize: textStyle.fontSize ?? 14,
                fontWeightIndex: FontWeight.values
                    .indexOf(textStyle.fontWeight ?? FontWeight.bold),
                colorValue: textStyle.color?.value ?? 0xff000000,
                fontFamily: textStyle.fontFamily,
                letterSpacing: textStyle.letterSpacing,
                wordSpacing: textStyle.wordSpacing,
                decorationColorValue: textStyle.decorationColor?.value,
                decorationThickness: textStyle.decorationThickness,
                decorationStyleIndex: TextDecorationStyle.values.indexOf(
                  textStyle.decorationStyle ?? TextDecorationStyle.solid,
                ),
                fontStyle: FontStyle.values.indexOf(
                  textStyle.fontStyle ?? FontStyle.normal,
                ),
              ),
            );
      },
      onCpasLockTaggle: (caps) {
        setState(
          () {
            if (caps) {
              ref.watch(editorNoteProvider.notifier).state =
                  ref.read(editorNoteProvider).toUpperCase();
            } else {
              ref.watch(editorNoteProvider.notifier).state =
                  ref.read(editorNoteProvider).toLowerCase();
            }
          },
        );
      },
    );
  }

  TextStyle textStyle(SerializableTextStyleModel textStyleProvider) {
    return TextStyle(
      color: Color(textStyleProvider.colorValue ?? 0xff000000),
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
