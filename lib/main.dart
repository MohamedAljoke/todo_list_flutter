import 'package:flutter/material.dart';
import 'package:todo_list_flutter/providers/tasks_provider.dart';
import 'package:todo_list_flutter/screens/taks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
