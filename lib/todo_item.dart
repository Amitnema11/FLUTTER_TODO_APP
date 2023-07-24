import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo.dart';



class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

   TodoItem ({Key? key, required this.todo, required this.onToDoChanged,required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
      onTap: () {
        // print('clicked on todo');
        onToDoChanged(todo);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.white,
      leading: Icon(
        todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: Colors.blue,
      ),
      title: Text(
        todo.todoText!,
        style: TextStyle(fontSize: 16,
            color: Colors.black,
      decoration: todo.isDone? TextDecoration.lineThrough : null,
        ),
      ),

      trailing: Container(
        height: 35,
        width: 35,
        // decoration: BoxDecoration(
        //   // borderRadius: BorderRadius.circular(5),
        // ),
        child: IconButton(
          color: Colors.red,
        icon: Icon(Icons.delete),
          onPressed: () {
            onDeleteItem(todo.id);
          },
                      ),
      ),
    )
    );
  }
}
