import 'package:flutter/material.dart';
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
        var formatDate = DateFormat.yMMMd(selectedDate).toString();
        print(formatDate);

        // selectedDateAndTime = '$formatDate ${selectedTime.toString()}';
        // dateTimeController.text = selectedDateAndTime;
      }
    }
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
