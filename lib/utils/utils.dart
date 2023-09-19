import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks_app/screens/new_task_screen.dart';

class Utils {
  static moveToNextScreen(BuildContext context, ) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NewTaskScreen()));
  }
}
