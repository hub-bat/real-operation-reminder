import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:real_operation_reminder/pages/todo_page.dart';

void main() async {
  //initalize Hive DB
  await Hive.initFlutter();

  //open box
  var box = await Hive.openBox('ToDoDB');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //testing
    return const MaterialApp(
      home: ToDoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
