import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/home/view/home.dart';
import 'package:time_managment/ui/profile/view/profile.dart';


class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
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
        title: ConstantsAppbar.appBarTitleText(),
      ),
      body: Padding(
        padding: const PagePadding.allMiddle(),
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 45,
                  color: Colors.black,
                ),
              ),
            ),
            cardWidgetCrate(
              context: context,
              labelText: ConstantsSignIn.userName,
              onEditingComplete: () {},
            ),
            cardWidgetCrate(
              context: context,
              labelText: ConstantsSignIn.name,
              onEditingComplete: () {},
            ),
            cardWidgetCrate(
              context: context,
              labelText: ConstantsSignIn.lastName,
              onEditingComplete: () {},
            ),
            cardWidgetCrate(
              context: context,
              labelText: ConstantsSignIn.eMail,
              onEditingComplete: () {},
            ),
            cardWidgetCrate(
              context: context,
              labelText: ConstantsSignIn.phoneNumber,
              onEditingComplete: () {},
            ),
            cardWidgetCrate(
              context: context,
              labelText: ConstantsSignIn.password,
              onEditingComplete: () {},
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 45,
              ),
              label: Text(
                ConstantsSignIn.register,
                style: ThemeDataCreate().textStyle2(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidgetCrate(
      {required BuildContext context,
      required String labelText,
      required Function()? onEditingComplete}) {
    return Padding(
      padding: const PagePadding.allLow(),
      child: Card(
        color: Colors.black,
        child: const Profile().textFormFieldCreate(
          labelText: labelText,
          initialText: "",
          context: context,
          onEditingComplete: () {
            // FirebaseAuthApp().signIn(email, password)
          },
        ),
      ),
    );
  }
}
