import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:time_managment/core/models/text_style/serializable_text_style_model.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/models/user_information/user_information_model.dart';
import 'package:time_managment/core/services/serializable_text_style_managment_manager.dart';
import 'package:time_managment/core/services/time_managment_manager.dart';


final taskListProvider =
    StateNotifierProvider<TimeManagmentManager, List<TimeManagmentModel>>(
  (ref) {
    return TimeManagmentManager();
  },
);

final editorNoteProvider = StateProvider<String>(
  (ref) {
    return "";
  },
);

final editorHeaderProvider = StateProvider<String>(
  (ref) {
    return "";
  },
);

final editorTextAlignProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

final taskDateProvider = StateProvider<DateTime>(
  (ref) {
    return DateTime.now();
  },
);

final taskTimeProvider = StateProvider<TimeOfDay>(
  (ref) {
    return TimeOfDay.fromDateTime(DateFormat('hh.mm').parse('00.00'));
  },
);

final editorTextStyleProvider = StateNotifierProvider<
    SerializableTextStyleManagmentManager, SerializableTextStyleModel>(
  (ref) {
    return SerializableTextStyleManagmentManager();
  },
);

final currentTaskProvider = Provider<TimeManagmentModel>(
  (ref) {
    throw UnimplementedError();
  },
);

final taskInkwellClickProvider = StateProvider<TimeManagmentModel>(
  (ref) {
    return TimeManagmentModel(
      id: 0,
      header: "",
      nots: "",
      hour: "",
      date: DateTime(0000),
      completed: false,
      textAlign: 0,
      textStyle: SerializableTextStyleModel(
        fontSize: 20,
        fontWeightIndex: 1,
        colorValue: 0xff000000,
        fontFamily: "OpenSans",
        letterSpacing: 1,
        wordSpacing: 1,
        decorationColorValue: 0xff000000,
        decorationThickness: 1,
        decorationStyleIndex: 1,
        height: 1,
        backgroundColorValue: 0x00000000,
        fontStyle: 0,
      ),
    );
  },
);

final userInformationProvider = StateProvider<UserInformationModel>(
  (ref) {
    return UserInformationModel(
      id: 0,
      image: [0],
      userName: "",
      name: "",
      lastName: "",
      eMail: "",
      phoneNumber: "",
      password: "",
    );
  },
);
