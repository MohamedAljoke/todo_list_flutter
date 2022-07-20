import 'package:flutter/material.dart';
import 'package:todo_list_flutter/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        TaskItem(),
        TaskItem(),
      ],
    );
  }
}
