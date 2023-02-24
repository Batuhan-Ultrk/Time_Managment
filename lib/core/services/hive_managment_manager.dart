import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/models/user_information/user_information_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';

class HiveManagmentManager {
  static Box<TimeManagmentModel> getTimeManagmentModels() =>
      Hive.box<TimeManagmentModel>('TimeManagmentModels');

  static Box<UserInformationModel> getUserInformationModel() =>
      Hive.box<UserInformationModel>('UserInformationModel');

  Future<List<TimeManagmentModel>> _readTimeManagmentModels() async {
    final boxTimeManagmentModels = getTimeManagmentModels();
    final tasks =
        boxTimeManagmentModels.values.toList().cast<TimeManagmentModel>();
    return tasks;
  }

  Future<List<UserInformationModel>> _readUserInformationModel() async {
    final boxUserInformationModel = getUserInformationModel();
    final user =
        boxUserInformationModel.values.toList().cast<UserInformationModel>();
    return user;
  }

  void write(WidgetRef ref, BuildContext context, int id) {
    final box = HiveManagmentManager.getTimeManagmentModels();
    ref.read(taskListProvider.notifier).addTask(
          TimeManagmentModel(
            id: id,
            header: ref.read(editorHeaderProvider),
            nots: ref.read(editorNoteProvider),
            hour: ref.read(taskTimeProvider).format(context),
            date: ref.read(taskDateProvider),
            completed: false,
            textStyle: ref.read(editorTextStyleProvider),
            textAlign: ref.read(editorTextAlignProvider),
          ),
        );
    box.put(
      id,
      TimeManagmentModel(
        id: id,
        header: ref.read(editorHeaderProvider),
        nots: ref.read(editorNoteProvider),
        hour: ref.read(taskTimeProvider).format(context),
        date: ref.read(taskDateProvider),
        completed: false,
        textStyle: ref.read(editorTextStyleProvider),
        textAlign: ref.read(editorTextAlignProvider),
      ),
    );
  }

  void getDatabase(WidgetRef ref) async {
    List<TimeManagmentModel> tasks =
        await HiveManagmentManager()._readTimeManagmentModels();
    if (tasks.isNotEmpty) {
      for (var i = 0; i < tasks.length; i++) {
        ref.read(taskListProvider.notifier).addTask(
              TimeManagmentModel(
                id: tasks[i].id,
                header: tasks[i].header,
                nots: tasks[i].nots,
                hour: tasks[i].hour,
                date: tasks[i].date,
                completed: tasks[i].completed,
                textStyle: tasks[i].textStyle,
                textAlign: tasks[i].textAlign,
              ),
            );
      }
    }
    /*List<UserInformationModel> user =
        await HiveManagmentManager()._readUserInformationModel();
    if (user.isNotEmpty) {
      for (var i = 0; i < user.length; i++) {
        ref.read(userInformationProvider.notifier).state = UserInformationModel(
          id: user[i].id,
          image: user[i].image,
          userName: user[i].userName,
          name: user[i].name,
          lastName: user[i].lastName,
          eMail: user[i].eMail,
          phoneNumber: user[i].phoneNumber,
          password: user[i].password,
        );
      }
    }*/
  }

  void deleteUser(WidgetRef ref, UserInformationModel user) {
    // ignore: unused_result
    ref.refresh(userInformationProvider);
    final box = getUserInformationModel();
    box.delete(user.id);
  }

  void deleteTask(WidgetRef ref, TimeManagmentModel task) {
    ref.watch(taskListProvider.notifier).removeTask(task);
    final box = getTimeManagmentModels();
    box.delete(task.id);
  }

  void updateUser(WidgetRef ref, UserInformationModel user) {
    final box = getUserInformationModel();
    box.put(user.id, user);

    ref.watch(userInformationProvider.notifier).state = UserInformationModel(
      id: user.id,
      image: user.image,
      userName: user.userName,
      name: user.name,
      lastName: user.lastName,
      eMail: user.eMail,
      phoneNumber: user.phoneNumber,
      password: user.password,
    );
  }

  void updateTask(WidgetRef ref, TimeManagmentModel chosenTask) {
    final box = getTimeManagmentModels();
    box.put(chosenTask.id, chosenTask);

    ref.watch(taskListProvider.notifier).updateTask(
          TimeManagmentModel(
            id: chosenTask.id,
            header: chosenTask.header,
            nots: chosenTask.nots,
            hour: chosenTask.hour,
            date: chosenTask.date,
            completed: chosenTask.completed,
            textStyle: chosenTask.textStyle,
            textAlign: chosenTask.textAlign,
          ),
        );
  }
}
