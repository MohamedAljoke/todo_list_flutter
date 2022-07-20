import 'package:flutter/foundation.dart';
import '../models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<Task> tasks = [];
  void toggleTaskState(int idx) {
    tasks[idx].isDone = !tasks[idx].isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  String lenOfTask() {
    return tasks.length.toString();
  }

  void addTask(newTaskTitle) {
    tasks.add(
      Task(name: newTaskTitle),
    );
    notifyListeners();
  }
}
