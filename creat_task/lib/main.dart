import 'package:creat_task/adapter.dart';
import 'package:creat_task/splash.dart';
import 'package:creat_task/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.openBox<Task>('task');

  await Hive.openBox<bool>('mode');
  await Hive.openBox('user');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<bool>('mode').listenable(),
        builder: (context, value, child) {
          bool darkmode = value.get('darkmode', defaultValue: false)!;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: darkmode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkThem,
            theme: lightThem, //هوحد الفونت على اي تكست و دا عباره عن شكل الكلام
            home: const Splash(),
          );
        });
  }
}
