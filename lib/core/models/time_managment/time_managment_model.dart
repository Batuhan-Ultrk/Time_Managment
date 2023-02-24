import 'package:hive_flutter/adapters.dart';
import 'package:time_managment/core/models/text_style/serializable_text_style_model.dart';


part 'time_managment_model.g.dart';

@HiveType(typeId: 0)
class TimeManagmentModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String header;

  @HiveField(2)
  final String nots;

  @HiveField(3)
  final String hour;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final SerializableTextStyleModel textStyle;

  @HiveField(6)
  final int textAlign;

  @HiveField(7)
  bool completed;

  TimeManagmentModel(
      {required this.id,
      required this.header,
      required this.nots,
      required this.hour,
      required this.date,
      required this.textStyle,
      required this.textAlign,
      required this.completed});
}
