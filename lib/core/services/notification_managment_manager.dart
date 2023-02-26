import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/notification/local_notification.dart.dart';
import 'package:time_managment/core/providers/all_providers.dart';

class NotificationManagmentManager {
  static void notificationAdd(WidgetRef ref, BuildContext context, int id) {
    LocalNotification().showNotification(
      ref.read(taskDateProvider),
      ref.read(taskTimeProvider),
      context,
      ref.read(
        editorHeaderProvider,
      ),
      id,
    );
  }

  static void notificationCancel(int id) {
    LocalNotification().cancelNotification(id);
    // print(id);
  }
}
