// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'task.dart';
import 'add_edit_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DBHelper dbHelper;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    _loadTasks();
  }

  void _loadTasks() async {
    List<Task> loadedTasks = await dbHelper.getTasks();
    setState(() {
      tasks = loadedTasks;
    });
  }

  void _addTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEditTaskScreen()),
    );

    if (result == true) {
      _loadTasks();
    }
  }

  void _editTask(Task task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEditTaskScreen(task: task)),
    );

    if (result == true) {
      _loadTasks();
    }
  }

  void _deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.status),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editTask(task),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(task.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
