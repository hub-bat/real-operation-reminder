import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:real_operation_reminder/data/database.dart';
import 'package:real_operation_reminder/utilities/addtask_button.dart';
import 'package:real_operation_reminder/utilities/todo.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _myBox = Hive.box('ToDoDB');
  ToDoListDB db = ToDoListDB();
  //Test data
  @override
  void initState() {
    db.loadData();
  }

  void onSave() {
    //Save task to DB
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });

    db.updateData();
    Navigator.of(context).pop();
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        elevation: 0,
      ),
      floatingActionButton:
          AddTask_Button(controller: _controller, onSave: onSave),
      drawer: Drawer(),
      body: Center(
          child: ListView.builder(
              itemCount: db.ToDoList.length,
              itemBuilder: (context, index) {
                return ToDo(
                  taskName: db.ToDoList[index][0],
                  taskCompleted: db.ToDoList[index][1],
                  onChanged: (value) => setState(() {
                    db.ToDoList[index][1] = !db.ToDoList[index][1];
                  }),
                );
              })),
    );
  }
}
