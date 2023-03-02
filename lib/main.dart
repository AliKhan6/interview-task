import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:interview_task/ui/screens/task/task_screen.dart';
import 'package:interview_task/ui/screens/task/task_view_model.dart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TaskViewModel())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Interview Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
