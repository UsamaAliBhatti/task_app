import 'package:flutter/material.dart';
import 'package:tasks_app/utils/utils.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Utils.moveToNextScreen(context);
          },
          child: const Icon(Icons.add_task_sharp)),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Task $index'),
          );
        },
      ),
    );
  }
}
