import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:time_managment/core/models/text_style/serializable_text_style_model.dart';
import 'package:time_managment/core/models/time_managment/time_managment_model.dart';
import 'package:time_managment/core/models/user_information/user_information_model.dart';
import 'package:time_managment/core/services/hive_managment_manager.dart';
import 'package:time_managment/features/theme_data/theme_data.dart';

import 'ui/home/view/home.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TimeManagmentModelAdapter());
  Hive.registerAdapter(SerializableTextStyleModelAdapter());
  await Hive.openBox<TimeManagmentModel>('TimeManagmentModels');
  Hive.registerAdapter(UserInformationModelAdapter());
  await Hive.openBox<UserInformationModel>('UserInformationModel');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    HiveManagmentManager().getDatabase(ref);
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'time Managment',
      home: const HomeView(),
      theme: ThemeDataCreate().themedata(),
    );
  }
}
