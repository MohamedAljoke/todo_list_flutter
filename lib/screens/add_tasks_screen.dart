import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  AddTask({
    Key? key,
    required this.addTaskFunction,
  }) : super(key: key);

  Function addTaskFunction;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late String setNewTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                onChanged: (newTask) {
                  setNewTask = newTask;
                },
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  widget.addTaskFunction(setNewTask);
                },
                child: const Text(
                  'Add Task',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ]),
      ),
    );
  }
}
