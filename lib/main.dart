import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO LIST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TO DO APPLICATION'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ['First Task', 'Second Task'];
  TextEditingController textEditingController = TextEditingController();

  void addItem() {
    setState(() {
      items.add(textEditingController.text);
      textEditingController.clear();
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.check_box_outline_blank),
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeItem(index);
              },
            ),
            title: Text(items[index]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add task',
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(labelText: 'Enter your task'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('ADD'),
                    onPressed: () {
                      addItem();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';

// void main() {
//   runApp(ToDoListApp());
// }

// class ToDoListApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do List',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ToDoListScreen(),
//     );
//   }
// }

// class ToDoListScreen extends StatefulWidget {
//   @override
//   _ToDoListScreenState createState() => _ToDoListScreenState();
// }

// class _ToDoListScreenState extends State<ToDoListScreen> {
//   Map<String, List<String>> tasks = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To-Do List'),
//       ),
//       body: ListView.builder(
//         itemCount: tasks.length,
//         itemBuilder: (context, index) {
//           String category = tasks.keys.elementAt(index);
//           List<String> categoryTasks = tasks[category]!;
//           return ExpansionTile(
//             title: Text(category),
//             children: categoryTasks.map((task) {
//               return ListTile(
//                 title: Text(task),
//               );
//             }).toList(),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               String newCategory = '';
//               String newTask = '';
//               return AlertDialog(
//                 title: Text('Add Task'),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       onChanged: (value) {
//                         newCategory = value;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Category',
//                       ),
//                     ),
//                     TextField(
//                       onChanged: (value) {
//                         newTask = value;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Task',
//                       ),
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   FlatButton(
//                     onPressed: () {
//                       setState(() {
//                         if (tasks.containsKey(newCategory)) {
//                           tasks[newCategory]!.add(newTask);
//                         } else {
//                           tasks[newCategory] = [newTask];
//                         }
//                       });
//                       Navigator.pop(context);
//                     },
//                     child: Text('Add'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }