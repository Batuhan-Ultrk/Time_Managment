import 'package:hive_flutter/adapters.dart';
part 'user_information_model.g.dart';

@HiveType(typeId: 2)
class UserInformationModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  List<int> image;

  @HiveField(2)
  String userName;

  @HiveField(3)
  String name;

  @HiveField(4)
  String lastName;

  @HiveField(5)
  String eMail;

  @HiveField(6)
  String phoneNumber;

  @HiveField(7)
  String password;

  UserInformationModel({
    required this.id,
    required this.image,
    required this.userName,
    required this.name,
    required this.lastName,
    required this.eMail,
    required this.phoneNumber,
    required this.password,
  });
}
