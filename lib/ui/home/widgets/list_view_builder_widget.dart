import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/core/services/hive_managment_manager.dart';
import 'package:time_managment/core/services/notification_managment_manager.dart';
import 'task_create_widget.dart';

class ListViewBuilderWidget extends ConsumerWidget {
  const ListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTask = ref.watch(taskListProvider);
    var allTaskSorted = allTask
      ..sort((a, b) {
        DateTime aDate = DateTime.parse(
            "${a.date.toIso8601String().substring(0, 10)} ${a.hour}");
        DateTime bDate = DateTime.parse(
            "${b.date.toIso8601String().substring(0, 10)} ${b.hour}");
        return aDate.compareTo(bDate);
      });

    return ListView.builder(
      itemCount: allTaskSorted.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(allTaskSorted[index].id),
          onDismissed: (direction) {
            NotificationManagmentManager.notificationCancel(
                allTaskSorted[index].id);
            HiveManagmentManager().deleteTask(ref, allTaskSorted[index]);
          },
          child: ProviderScope(
            overrides: [
              currentTaskProvider.overrideWithValue(allTaskSorted[index]),
            ],
            child: const TaskCreateWidget(),
          ),
        );
      },
    );
  }
}
