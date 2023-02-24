import 'package:hive_flutter/adapters.dart';
part 'serializable_text_style_model.g.dart';

@HiveType(typeId: 1)
class SerializableTextStyleModel extends HiveObject {
  @HiveField(0)
  final double? fontSize;

  @HiveField(1)
  final int? fontWeightIndex;

  @HiveField(2)
  final int? colorValue;

  @HiveField(3)
  final String? fontFamily;

  @HiveField(4)
  final double? letterSpacing;

  @HiveField(5)
  final double? wordSpacing;

  @HiveField(6)
  final int? decorationColorValue;

  @HiveField(7)
  final double? decorationThickness;

  @HiveField(8)
  final int? decorationStyleIndex;

  @HiveField(9)
  final int? backgroundColorValue;

  @HiveField(10)
  final double? height;

  @HiveField(11)
  final int? fontStyle;

  SerializableTextStyleModel({
    required this.fontSize,
    required this.fontWeightIndex,
    required this.colorValue,
    required this.fontFamily,
    required this.letterSpacing,
    required this.wordSpacing,
    required this.decorationColorValue,
    required this.decorationThickness,
    required this.decorationStyleIndex,
    required this.backgroundColorValue,
    required this.height,
    required this.fontStyle,
  });
}
