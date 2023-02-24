// ignore_for_file: unused_result
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_int_id/safe_int_id.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/services/hive_managment_manager.dart';
import 'package:time_managment/core/services/notification_managment_manager.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/home/view/home.dart';
import 'package:time_managment/ui/task/widgets/creating_note.dart';
import 'package:time_managment/ui/task/widgets/date_time_widget.dart';
import 'package:time_managment/ui/task/widgets/set_time_widget.dart';

class Task extends ConsumerWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: ConstantsAppbar.appBarTitleText(),
        leading: ConstantsAppbar.appBarLeadingIcon(
          context,
          () {
            ConstantProviderRefresh.refreshProvider(ref, context);

            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              int id = safeIntId.getId() ~/ 10000;
              HiveManagmentManager().write(
                ref,
                context,
                id,
              );
              NotificationManagmentManager.notificationAdd(
                ref,
                context,
                id,
              );
              ConstantProviderRefresh.refreshProvider(
                ref,
                context,
              );
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            },
            icon: const Icon(
              Icons.assignment_turned_in_outlined,
            ),
          )
        ],
      ),
      body: Container(
        decoration: ThemeDataCreate.boxDecorationLinearGradient(),
        child: Padding(
          padding: const PagePadding.allMiddle(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              DateTimeLineWidget(),
              SetTimeWidget(),
              CreatingNote(),
            ],
          ),
        ),
      ),
    );
  }
}
