import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/home/widgets/bottom_container_widget.dart';
import 'package:time_managment/ui/home/widgets/list_view_builder_widget.dart';
import 'package:time_managment/ui/home/widgets/row_widget_header1.dart';
import 'package:time_managment/ui/home/widgets/row_widget_header2.dart';
import 'package:time_managment/ui/sign_in/view/sign_in.dart';
import 'package:time_managment/ui/task/view/task.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    String userMail = ref.watch(userInformationProvider).eMail;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/time_management_logo.png",
          color: Colors.white,
        ),
        title: ConstantsAppbar.appBarTitleText(),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      // ref.watch(userInformationProvider).eMail == ""
                      //  ?
                      const SignIn()
                  //: const Profile(),
                  ),
            ),
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const Task(),
              ),
            ),
            icon: const Icon(
              Icons.task_alt_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: ThemeDataCreate.boxDecorationLinearGradient(),
        child: Column(
          children: const [
            Padding(
              padding: PagePadding.onlyPadding(),
              child: RowWidgetHeader1(),
            ),
            Padding(
              padding: PagePadding.onlyPadding(),
              child: RowWidgetHeader2(),
            ),
            Expanded(
              child: Padding(
                padding: PagePadding.onlyPaddingHome(),
                child: ListViewBuilderWidget(),
              ),
            ),
            BottomContainerWidget(),
          ],
        ),
      ),
    );
  }
}
