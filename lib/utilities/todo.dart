import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  final String taskName;
  final bool? taskCompleted;
  Function(bool?)? onChanged;
  ToDo(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: taskCompleted,
      title: Text(taskName),
      onChanged: onChanged,
      secondary: Icon(Icons.star),
    );
  }
}