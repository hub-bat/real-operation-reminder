import 'package:flutter/material.dart';
import 'package:real_operation_reminder/data/database.dart';

class AddTask_Button extends StatelessWidget {
  VoidCallback onSave;
  TextEditingController controller;
  AddTask_Button({
    super.key,
    required this.onSave,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => createDialog(context), child: Icon(Icons.add));
  }

  void createDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                  child: Column(
            children: [
              //Text input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Add a new task"),
              ),
              //buttons
              Row(
                children: [
                  //Save button
                  MaterialButton(onPressed: onSave, child: Text("Save Task")),
                  //Cancel button
                  MaterialButton(onPressed: () => (), child: Text("Cancel"))
                ],
              )
            ],
          )));
        });
  }
}
