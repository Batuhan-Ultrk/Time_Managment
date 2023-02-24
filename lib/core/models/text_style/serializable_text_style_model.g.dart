// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_text_style_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SerializableTextStyleModelAdapter
    extends TypeAdapter<SerializableTextStyleModel> {
  @override
  final int typeId = 1;

  @override
  SerializableTextStyleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SerializableTextStyleModel(
      fontSize: fields[0] as double?,
      fontWeightIndex: fields[1] as int?,
      colorValue: fields[2] as int?,
      fontFamily: fields[3] as String?,
      letterSpacing: fields[4] as double?,
      wordSpacing: fields[5] as double?,
      decorationColorValue: fields[6] as int?,
      decorationThickness: fields[7] as double?,
      decorationStyleIndex: fields[8] as int?,
      backgroundColorValue: fields[9] as int?,
      height: fields[10] as double?,
      fontStyle: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SerializableTextStyleModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.fontSize)
      ..writeByte(1)
      ..write(obj.fontWeightIndex)
      ..writeByte(2)
      ..write(obj.colorValue)
      ..writeByte(3)
      ..write(obj.fontFamily)
      ..writeByte(4)
      ..write(obj.letterSpacing)
      ..writeByte(5)
      ..write(obj.wordSpacing)
      ..writeByte(6)
      ..write(obj.decorationColorValue)
      ..writeByte(7)
      ..write(obj.decorationThickness)
      ..writeByte(8)
      ..write(obj.decorationStyleIndex)
      ..writeByte(9)
      ..write(obj.backgroundColorValue)
      ..writeByte(10)
      ..write(obj.height)
      ..writeByte(11)
      ..write(obj.fontStyle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerializableTextStyleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
