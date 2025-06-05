import 'package:flutter/material.dart';
import 'package:my_schedule/controller/task_controller.dart';
import 'package:my_schedule/controller/theme_controller.dart';
import 'package:my_schedule/pages/inicial_page.dart';
import 'package:my_schedule/pages/pages_internas/add_task_page.dart';
import 'package:my_schedule/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => TaskController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp(
      title: 'My Schedule',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      home: const InicialPage(),
      routes: {'/nova-tarefa': (context) => AddTaskPage()},
    );
  }
}
