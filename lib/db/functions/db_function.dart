import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/data_modal.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> studentListNotifier = [];

  Future<void> addStudent(StudentModel value) async {
    // studentListNotifier.value.add(value);
    //here student list notifier is the class of value notifier and value that are adding is list type
    // print(value.toString());

    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);
    value.id = id;
    studentListNotifier.add(value);
    notifyListeners();
    //here we use notifylisteners because to notify the list without this the list widget won't work
  }

  Future<void> getallstudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentListNotifier.clear();

    notifyListeners();
    studentListNotifier.addAll(studentDB.values);
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');

    await studentDB.deleteAt(id);
    getallstudents();
  }

  Future<void> editList(int id, StudentModel value) async {
    final studentDatabase = await Hive.openBox<StudentModel>('student_db');
    studentDatabase.putAt(id, value);
    getallstudents();
  }
}
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';

// import '../db_model/data_model.dart';

// class StudentProvider extends ChangeNotifier {
//   List<StudentModel> studentList = [];

//   Future<void> addStudent(StudentModel value) async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');
//     final id = await studentDB.add(value);
//     value.id = id;
//     studentList.add(value);
//     notifyListeners();
//   }

//   Future<void> getallstudents() async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');
//     studentList.clear();

//     notifyListeners();
//     studentList.addAll(studentDB.values);
//   }

//   Future<void> deleteStudent(int id) async {
//     final studentDB = await Hive.openBox<StudentModel>('student_db');

//     await studentDB.deleteAt(id);
//     getallstudents();
//   }

//   Future<void> editList(int id, StudentModel value) async {
//     final studentDatabase = await Hive.openBox<StudentModel>('student_db');
//     studentDatabase.putAt(id, value);
//     getallstudents();
//   }
// }
