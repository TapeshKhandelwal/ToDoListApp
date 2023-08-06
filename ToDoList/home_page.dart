import 'package:flutter/material.dart';
import 'package:orom/ToDoList/dialog_box.dart';
import 'package:orom/ToDoList//todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    // ["Assignment", false],
    // ["Gym", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // void color_Change(){
  //   Colorschange => setState(() {
  //     color:Colors.red;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: const Center(
              child: Text('TO DO LIST',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          elevation: 20,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: createNewTask,
          label: Text('Click to add new task',
              style: TextStyle(fontWeight: FontWeight.bold)),
          icon: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              //color_Change: color_Change(Colorschange),
            );
          },
        ));
  }
}

// Text("Add Your Tasks",
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.bold,
// color: Colors.deepPurple,
// decoration: TextDecoration.underline)),
// SizedBox(height: 15),