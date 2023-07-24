import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_item.dart';
import 'package:flutter_todo_app/todo.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   // Home({super.key});
  final todosList = ToDo.todoList();
  Set<ToDo> _foundToDo = {};

  final _todoController = TextEditingController();
  
  @override
  void initState() {
_foundToDo = todosList;
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              children: [
                searchBox(),

                Expanded (
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom: 20),
                        child: Text('All ToDo', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      ),

                      for(ToDo todoo in _foundToDo)
                      TodoItem(todo: todoo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
         Align(
           alignment: Alignment.bottomCenter,
           child: Row(
             children: [
               Expanded(child:
               Container(
                 margin: EdgeInsets.only(bottom: 10,right: 20,left: 20
                 ),
                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                 decoration: BoxDecoration(
                   color: Colors.white70,
                   boxShadow: const [BoxShadow(color: Colors.grey,
                       blurRadius: 10,
                     spreadRadius: 0
                   ),],
                   borderRadius: BorderRadius.circular(10),
                 ),
                   child: TextField(
                     controller: _todoController,
                     decoration: InputDecoration(
                       hintText: 'Add new todo item',
                       border: InputBorder.none
                     ),
                   ),

               ),
               ),
                 Container(
                   margin: EdgeInsets.only(bottom: 10,right: 20,left: 20
                   ),
                   child: ElevatedButton(
                    child: Text('+', style: TextStyle( fontSize: 40, ),),
                     onPressed: () {
                      _addToDoItem(_todoController.text);
                     },
                     style: ElevatedButton.styleFrom(
                       minimumSize: Size(60, 60)
                     ),

                     ),
                 ),
             ],
           ),
         ),
        ],
      ),
    );
  }

  void _handleToDoChange (ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;

    });
  }
  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);

    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
      ));

    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword){
    Set<ToDo> results = {};
    if (enteredKeyword.isEmpty){
      results = todosList;
    }else{
      results = todosList.where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toSet();
    }
    setState(() {
      _foundToDo = results;
    });
  }
  
  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)

      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,color: Colors.black,size: 20
            ,),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25
          ),
          border: InputBorder.none,
          hintText: 'search',
          hintStyle: TextStyle(color: Colors.grey[900]),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor:Colors.grey[200],
      elevation: 0,
      title: Row(
        children: [
          Icon(Icons.menu, color: Colors.black,size: 30,)
        ],
      ),
    );
  }
}
