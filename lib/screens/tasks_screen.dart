import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/providers/task_provider.dart';
import 'package:tasks_app/utils/utils.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Tasks'),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Utils.moveToNextScreen(context);
                },
                child: const Icon(Icons.add_task_sharp)),
            body: StreamBuilder<QuerySnapshot>(
              stream: provider.fireStore,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(
                        Icons.task,
                        size: 30,
                      ),
                      title: Text(snapshot.data!.docs[index]['title']),
                      subtitle: Text(snapshot.data!.docs[index]['description']),
                    );
                  },
                );
              },
            ));
      },
    );
  }
}
