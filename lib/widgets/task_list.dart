import 'package:flutter/material.dart';
import 'package:todo_list_flutter/widgets/task_item.dart';
import 'package:todo_list_flutter/models/task_model.dart';

class TasksList extends StatelessWidget {
  TasksList({
    Key? key,
    required this.tasks,
    required this.changeTaskStatus,
  }) : super(key: key);
  final List<Task> tasks;
  final Function changeTaskStatus;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
          taskLabel: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            changeTaskStatus(index);
          },
        );
      },
    );
  }
}
