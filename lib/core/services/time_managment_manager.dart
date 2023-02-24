import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';



class TimeManagmentManager extends StateNotifier<List<TimeManagmentModel>> {
  TimeManagmentManager([List<TimeManagmentModel>? initalItem])
      : super(initalItem ?? []);

  addTask(TimeManagmentModel task) {
    state = [
      ...state,
      TimeManagmentModel(
        id: task.id,
        header: task.header,
        nots: task.nots,
        hour: task.hour,
        date: task.date,
        completed: task.completed,
        textStyle: task.textStyle,
        textAlign: task.textAlign,
      )
    ];
  }

  void updateTask(TimeManagmentModel updatedTask) {
    state = [
      for (var task in state)
        if (task.id == updatedTask.id)
          TimeManagmentModel(
            id: updatedTask.id,
            header: updatedTask.header,
            nots: updatedTask.nots,
            hour: updatedTask.hour,
            date: updatedTask.date,
            completed: updatedTask.completed,
            textStyle: updatedTask.textStyle,
            textAlign: updatedTask.textAlign,
          )
        else
          task,
    ];
  }

  void removeTask(TimeManagmentModel task) {
    state = state
        .where(
          (element) => element.id != task.id,
        )
        .toList();
  }
}
