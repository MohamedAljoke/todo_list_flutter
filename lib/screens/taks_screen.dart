import 'package:flutter/material.dart';
import 'package:todo_list_flutter/providers/tasks_provider.dart';
import 'package:todo_list_flutter/screens/add_tasks_screen.dart';
import 'package:todo_list_flutter/widgets/task_list.dart';
import 'package:todo_list_flutter/models/task_model.dart';
import 'package:provider/provider.dart';
import '../providers/tasks_provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void toggleTaskState(idx) {
    context.read<TaskProvider>().toggleTaskState(idx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTask(
                    addTaskFunction: (newTaskTitle) {
                      context.read<TaskProvider>().addTask(newTaskTitle);
                      Navigator.pop(context);
                    },
                  ));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
              30.0,
              60.0,
              30.0,
              30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Todo List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${context.watch<TaskProvider>().lenOfTask()} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              child: TasksList(
                tasks: context.watch<TaskProvider>().tasks,
                changeTaskStatus: toggleTaskState,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
