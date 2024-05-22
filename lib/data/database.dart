import 'package:hive/hive.dart';

class ToDoListDB {
  //dynamic list that stores key/value pair ("Name of Task", Task Value (Bool))
  List ToDoList = [];
  //opens the Hive box
  final _myBox = Hive.box('ToDoDB');

//load data
  void loadData() {
    ToDoList = _myBox.get('ToDoDB');
  }

//update data
  void updateData() {
    _myBox.put('ToDoDB', ToDoList);
  }
}
