import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/core/services/hive_managment_manager.dart';
import 'package:time_managment/core/services/notification_managment_manager.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/home/note_viewing/widget/constrained_box_widget.dart';
import 'package:time_managment/ui/home/note_viewing/widget/text_button_date_widget.dart';
import 'package:time_managment/ui/home/note_viewing/widget/text_button_time_widget.dart';
import 'package:time_managment/ui/home/note_viewing/widget/text_field_note_widget.dart';
import 'package:time_managment/ui/home/view/home.dart';


class NoteViewing extends ConsumerStatefulWidget {
  const NoteViewing({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoteViewingState();
}

class _NoteViewingState extends ConsumerState<NoteViewing> {
  @override
  Widget build(BuildContext context) {
    var chosenTask = ref.watch(taskInkwellClickProvider);

    return Scaffold(
      appBar: AppBar(
        title: ConstantsAppbar.appBarTitleText(),
        leading: ConstantsAppbar.appBarLeadingIcon(
          context,
          () {
            HiveManagmentManager().updateTask(ref, chosenTask);
            notificationAdd(chosenTask, context);
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: ThemeDataCreate.boxDecorationLinearGradient(),
              child: Padding(
                padding: const PagePadding.onlyPadding(),
                child: Column(
                  children: [
                    const ConstrainedBoxWidget(),
                    Padding(
                      padding: const PagePadding.allMiddle(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextButtonTimeWidget(),
                          TextButtonDateWidget(),
                        ],
                      ),
                    ),
                    Column(
                      children: const [
                        TextFieldNoteWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void notificationAdd(TimeManagmentModel chosenTask, BuildContext context) {
    if (ref.read(taskDateProvider.notifier).state != chosenTask.date &&
        ref.read(taskTimeProvider.notifier).state !=
            TimeOfDay(
              hour: int.parse(chosenTask.hour.split(":")[0]),
              minute: int.parse(chosenTask.hour.split(":")[1]),
            )) {
      ref.read(taskDateProvider.notifier).state = chosenTask.date;
      ref.read(taskTimeProvider.notifier).state = TimeOfDay(
        hour: int.parse(chosenTask.hour.split(":")[0]),
        minute: int.parse(chosenTask.hour.split(":")[1]),
      );
      NotificationManagmentManager.notificationAdd(
        ref,
        context,
        chosenTask.id,
      );
    }
  }
}
