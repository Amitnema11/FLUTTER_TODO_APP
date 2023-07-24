class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static Set<ToDo> todoList(){
    return {
      ToDo(id: '01',todoText: 'Morning Exercise',isDone: true),
      ToDo(id: '02',todoText: 'Buy Groceries',isDone: true),
      ToDo(id: '03',todoText: 'Pickup Friend',),
      ToDo(id: '04',todoText: 'Check Up Appointment',),
      ToDo(id: '05',todoText: 'Check Email',),
      ToDo(id: '06',todoText: 'Team Meeting',),




    };
  }
}