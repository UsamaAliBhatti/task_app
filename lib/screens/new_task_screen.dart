import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/providers/new_task_provider.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Task'),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: () {
                provider.createTask(context);
              },
              child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Create',
                    style: TextStyle(fontSize: 20),
                  ))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: provider.titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: provider.descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: provider.dateTimeController,
                  onTap: () {
                    provider.openDateAndTimeDialog(context);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'Date & Time',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
