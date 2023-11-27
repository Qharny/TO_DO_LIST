class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Code'),
      ToDo(id: '02', todoText: 'Eat'),
      ToDo(id: '03', todoText: 'Play ball'),
      ToDo(id: '04', todoText: 'Watch movies'),
      ToDo(
        id: '05',
        todoText: 'Go on a date',
      ),
    ];
  }
}
