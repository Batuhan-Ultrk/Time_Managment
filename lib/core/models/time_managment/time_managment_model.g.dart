// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_managment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeManagmentModelAdapter extends TypeAdapter<TimeManagmentModel> {
  @override
  final int typeId = 0;

  @override
  TimeManagmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeManagmentModel(
      id: fields[0] as int,
      header: fields[1] as String,
      nots: fields[2] as String,
      hour: fields[3] as String,
      date: fields[4] as DateTime,
      textStyle: fields[5] as SerializableTextStyleModel,
      textAlign: fields[6] as int,
      completed: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimeManagmentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.header)
      ..writeByte(2)
      ..write(obj.nots)
      ..writeByte(3)
      ..write(obj.hour)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.textStyle)
      ..writeByte(6)
      ..write(obj.textAlign)
      ..writeByte(7)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeManagmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
