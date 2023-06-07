// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../db/functions/db_function.dart';
import '../db/models/data_modal.dart';
import '../provider/widget_provider.dart';

class EditStudent extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String number;
  final int index;

  EditStudent({
    Key? key,
    required this.name,
    required this.age,
    required this.address,
    required this.number,
    required this.index,
  }) : super(key: key);

  TextEditingController _nameOfStudent = TextEditingController();
  TextEditingController _ageOfStudent = TextEditingController();
  TextEditingController _addressOfStudent = TextEditingController();
  TextEditingController _phnOfStudent = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _nameOfStudent = TextEditingController(text: name);
    _ageOfStudent = TextEditingController(text: age);
    _addressOfStudent = TextEditingController(text: address);
    _phnOfStudent = TextEditingController(text: number);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      'Edit Student',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<WidgetProvider>(
                        builder: (context, WidgetProvider, child) {
                      return WidgetProvider.textField(
                        fieldcontroller: _nameOfStudent,
                        hintText: 'Enter the name',
                        labelText: 'Name',
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<WidgetProvider>(
                      builder: (context, widgetProvider, child) {
                        return widgetProvider.textField(
                          fieldcontroller: _ageOfStudent,
                          hintText: 'Enter age',
                          labelText: 'Age',
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<WidgetProvider>(
                      builder: (context, widgetProvider, child) {
                        return widgetProvider.textField(
                          fieldcontroller: _addressOfStudent,
                          hintText: 'Enter address',
                          labelText: 'Address',
                          maxLines: 3,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<WidgetProvider>(
                      builder: (context, widgetProvider, child) {
                        return widgetProvider.textField(
                          fieldcontroller: _phnOfStudent,
                          hintText: 'Enter the number',
                          labelText: 'Number',
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              onEditSaveButton(context);
                              Navigator.of(context).pop();
                            }
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Update'),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> onEditSaveButton(context) async {
    final studentmodel = StudentModel(
      name: _nameOfStudent.text,
      age: _ageOfStudent.text,
      phnNumber: _phnOfStudent.text,
      address: _addressOfStudent.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        content: Text(
          'Updated',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    Provider.of<StudentProvider>(context, listen: false)
        .editList(index, studentmodel);
  }
}
