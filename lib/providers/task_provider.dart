import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final fireStore = FirebaseFirestore.instance.collection('Tasks').snapshots();
}
