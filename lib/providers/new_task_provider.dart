import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:intl/intl.dart';

class NewTaskProvider extends ChangeNotifier {
  var titleController = TextEditingController();
  var dateTimeController = TextEditingController();
  var descriptionController = TextEditingController();
  var firstDate = DateTime.now();
  var initial = DateTime.now();
  var lastDate = DateTime(2050);

  DateTime? selectedDate;
  var selectedTime = '';
  var selectedDateAndTime = '';

  openDateAndTimeDialog(BuildContext context) async {
    selectedDate = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (selectedDate != null && context.mounted) {
      var selectedTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (selectedTime != null) {
        var formatDate = DateFormat.yMMMd().format(selectedDate!);
        var formatTime = '${selectedTime.hour}:${selectedTime.hour}';

        selectedDateAndTime = '$formatDate  $formatTime';
        dateTimeController.text = selectedDateAndTime;
      }
    }
  }

  var fireStore = FirebaseFirestore.instance.collection('Tasks');
  createTask(BuildContext context) async {
    var dateTime = dateTimeController.text;
    var title = titleController.text;
    var description = descriptionController.text;
    if (dateTime.isNotEmpty && title.isNotEmpty && description.isNotEmpty) {
      await fireStore
          .doc()
          .set({
            'title': title,
            'description': description,
            'dateTime': dateTime,
            'status': 'incomplete'
          })
          .whenComplete(
              () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Task Created Successfully"),
                  )))
          .then((value) => clearFields(context));
    } else {
      FlutterToastr.show('Please Complete The Fields First', context);
    }
  }

  clearFields(BuildContext context) {
    titleController.clear();
    dateTimeController.clear();
    descriptionController.clear();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    dateTimeController.dispose();
    descriptionController.dispose();
  }
}
