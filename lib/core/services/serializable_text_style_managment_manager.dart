import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/models/text_style/serializable_text_style_model.dart';



class SerializableTextStyleManagmentManager
    extends StateNotifier<SerializableTextStyleModel> {
  SerializableTextStyleManagmentManager(
      [SerializableTextStyleModel? initalItem])
      : super(
          initalItem ??
              SerializableTextStyleModel(
                fontSize: 20,
                fontWeightIndex: 1,
                colorValue: 0xff000000,
                fontFamily: "OpenSans",
                letterSpacing: 1,
                wordSpacing: 1,
                decorationColorValue: 0xff000000,
                decorationThickness: 1,
                decorationStyleIndex: 1,
                backgroundColorValue: 0x00000000,
                height: 1,
                fontStyle: 0,
              ),
        );

  addTextStyle(SerializableTextStyleModel textStyleModel) {
    state = SerializableTextStyleModel(
      fontSize: textStyleModel.fontSize,
      fontWeightIndex: textStyleModel.fontWeightIndex,
      colorValue: textStyleModel.colorValue,
      fontFamily: textStyleModel.fontFamily,
      letterSpacing: textStyleModel.letterSpacing,
      wordSpacing: textStyleModel.wordSpacing,
      decorationColorValue: textStyleModel.decorationColorValue,
      decorationThickness: textStyleModel.decorationThickness,
      decorationStyleIndex: textStyleModel.decorationStyleIndex,
      backgroundColorValue: textStyleModel.backgroundColorValue,
      height: textStyleModel.height,
      fontStyle: textStyleModel.fontStyle,
    );
  }
}
