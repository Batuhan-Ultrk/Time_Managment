// ignore_for_file: unused_result
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/providers/all_providers.dart';

class ConstantsAppbar {
  static Widget appBarTitleText() {
    return const Text(
      "Time Management",
    );
  }

  static Widget appBarLeadingIcon(context, void Function()? onPressedIcon) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: onPressedIcon,
    );
  }
}

class ConstantProviderRefresh {
  static void refreshProvider(WidgetRef ref, BuildContext context) {
    ref.refresh(taskTimeProvider);
    ref.refresh(editorNoteProvider);
    ref.refresh(editorHeaderProvider);
    ref.refresh(taskDateProvider.notifier).state = DateTime.now();
    ref.refresh(editorTextStyleProvider);
    ref.refresh(editorTextAlignProvider);
  }
}

//TODO:Set time da default değer anlık saat olsun ve ona göre ayar yap.
class ConstantsTask {
  static const taskAddNote = "Click to add note";
  static const taskAddTime = "Click to add note";
  static final Time time = Time(
      hour: 0, minute: 0); //TimeOfDay.now().replacing(hour: 00, minute: 00);
  static const message = " It's time for the task dated :)";
  static const outdatedMessage = " you have an overdue task :( ";
}

class ConstantsSignIn {
  static const userName = "User Name";
  static const name = "Name";
  static const lastName = "Last Name";
  static const eMail = "Email";
  static const phoneNumber = "Phone Number";
  static const password = "Password";
  static const register = "Register";
}

class ConstantsEditor {
  static List<Color> paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  static const List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  static const hintTextBody = "Click for editing not";
  static const hintTextHeader = "Header";
}
