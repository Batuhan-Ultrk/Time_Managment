// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:time_managment/core/constant/constant.dart';

class LocalNotification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  LocalNotification() {
    var androidInitilize =
        const AndroidInitializationSettings('time_management_logo');
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initilizationsSettings,
        onDidReceiveNotificationResponse: notificationResponse);
  }

  Future showNotification(
      DateTime date, TimeOfDay time, context, String header, int id) async {
    var androidDetails = AndroidNotificationDetails(
      "Task Id",
      "Time",
      channelDescription: "Is My Task",
      importance: Importance.max,
      showProgress: true,
      showWhen: true,
      playSound: true,
      // color: Colors.orange, //eklenen fotonun rengi
    );
    var generalNotificationDetails = NotificationDetails(
      android: androidDetails,
    );

    String editTime =
        "${DateFormat("yyyy-MM-dd").format(date)} ${time.format(context)}";
    var editTimeDateTime = DateTime.parse(editTime);
    var dateNowEdit =
        DateTime.parse(DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()));
    var timeDifference = editTimeDateTime.difference(dateNowEdit);
    var scheduledTime = DateTime.now().add(timeDifference);

    flutterLocalNotificationsPlugin.schedule(
      id,
      header,
      timeDifference.inHours >= 0
          ? editTime + ConstantsTask.message
          : editTime + ConstantsTask.outdatedMessage,
      scheduledTime,
      generalNotificationDetails,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future notificationResponse(dynamic payload) async {}
}
