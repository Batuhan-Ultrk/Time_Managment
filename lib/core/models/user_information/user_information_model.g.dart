// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInformationModelAdapter extends TypeAdapter<UserInformationModel> {
  @override
  final int typeId = 2;

  @override
  UserInformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformationModel(
      id: fields[0] as int,
      image: (fields[1] as List).cast<int>(),
      userName: fields[2] as String,
      name: fields[3] as String,
      lastName: fields[4] as String,
      eMail: fields[5] as String,
      phoneNumber: fields[6] as String,
      password: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformationModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.eMail)
      ..writeByte(6)
      ..write(obj.phoneNumber)
      ..writeByte(7)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
