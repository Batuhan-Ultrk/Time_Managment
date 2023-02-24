import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment/core/constant/constant.dart';
import 'package:time_managment/core/models/user_information/user_information_model.dart';
import 'package:time_managment/core/providers/all_providers.dart';
import 'package:time_managment/features/padding/page_padding.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';
import 'package:time_managment/ui/home/view/home.dart';
import 'package:time_managment/ui/profile/user_data/view/user_data.dart';


class Profile extends ConsumerWidget {
  const Profile({super.key});
//TODO: Kullanıcı kayıt sekmesi yapılacak, veritabanı kayıt,silme güncelleme, okuma işlemleri tamam, profil sayfasına gelen kullanıcı bilgileri yazılıyor, Kullanıcı verileri gösterilecek profil sayfasında. Kayıt sayfası yapıldıktan sonra kulanıcı bilgileri veritabanına yazılacak, anasayfaya eğer kullanıcı giriş yaptıysa profil ekranı gösterme ikonu kullanıcı giriş yapmadıysa oturum açma sayfası gelecek oturum açma sayfası içerisinde kayıt sayfasına yönlendiren bir ikon olacak kullanıcı kaydı varsa giriş yaparken MongoDb veritabanında veriler gelecek Providera yazılacak kullanıcı kaydı yoksa kayıt işleminden sonra veriler hem hive veritabanına hem mongo db veritabanına yazılacak. son olarak profil sayfasına çıkış yap butonu koyulacak unutma.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserInformationModel user = ref.watch(userInformationProvider);
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.width / 3.5,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/images/time_management_logo.png",
                  ),
                ),
              ),
              textFormFieldCreate(
                initialText: user.userName,
                labelText: "UserName",
                context: context,
                onEditingComplete: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textFormFieldCreate(
                initialText: user.name,
                labelText: "Name",
                context: context,
                 onEditingComplete: () {},
              ),
              textFormFieldCreate(
                initialText: user.lastName,
                labelText: "LastName",
                context: context,
                 onEditingComplete: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textFormFieldCreate(
                initialText: user.phoneNumber,
                labelText: "PhoneNumber",
                context: context,
                 onEditingComplete: () {},
              ),
              textFormFieldCreate(
                initialText: user.eMail,
                labelText: "Email",
                context: context,
                 onEditingComplete: () {},
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const PagePadding.allLow(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: ThemeDataCreate.boxDecorationLinearGradient(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const PagePadding.allLow(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Veriler"),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 40, 41, 68),
                          thickness: 2,
                        ),
                        const UserData(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textFormFieldCreate(
      {required String labelText,
      required String initialText,
      required BuildContext context,
      required Function()? onEditingComplete}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.6,
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(labelText),
        ),
        initialValue: initialText,
        style: ThemeDataCreate().textStyle4(),
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
