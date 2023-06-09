import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../db/functions/db_function.dart';
import '../widgets/add_students.dart';
import '../widgets/students_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context).getallstudents();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Open search',
            onPressed: () {
              // showSearch(
              //   context: context,
              //   // delegate: SearchWidget(),
              // );
            },
          ),
          kWidth,
        ],
      ),
      body: const ListStudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddStudentClass();
              },
            ),
          );
        },
        tooltip: 'Add students',
        child: const Icon(Icons.add),
      ),
    );
  }
}
