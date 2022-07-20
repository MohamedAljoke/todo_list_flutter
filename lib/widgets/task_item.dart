import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_flutter/models/task_model.dart';
import '../providers/tasks_provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.taskLabel,
    required this.task,
    required this.isChecked,
    required this.checkBoxCallBack,
  }) : super(key: key);
  final bool isChecked;
  final String taskLabel;
  final Function checkBoxCallBack;
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        context.read<TaskProvider>().deleteTask(task);
      },
      title: Text(
        taskLabel,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          checkBoxCallBack(value);
        },
      ),
    );
  }
}
