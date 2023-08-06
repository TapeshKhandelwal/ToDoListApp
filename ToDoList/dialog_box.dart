import 'package:flutter/material.dart';
import 'package:orom/ToDoList//my_button.dart';
import 'package:flutter/src/material/input_border.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

       backgroundColor: Colors.cyan,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500.0),
        ),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration:InputDecoration(
                filled: true,
                fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // MyButton(
                //     text: "Save", onPressed: onSave,
                // ),
                ElevatedButton(
                    onPressed: onSave,
                    child: Text(" Save "),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    side: BorderSide(width:2,color:Colors.black45),
                    elevation: 100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onCancel,
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: BorderSide(width:2,color:Colors.black45),
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
