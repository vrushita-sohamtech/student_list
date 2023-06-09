import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_list/database.dart';
import 'package:student_list/main.dart';
import 'package:student_list/studentDetails.dart';

class AddStudents extends StatefulWidget {

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  // late Future<List<StudentDetails>> studentList;

   TextEditingController name = TextEditingController();
   TextEditingController iD = TextEditingController();
   TextEditingController dob= TextEditingController();
   TextEditingController email = TextEditingController();
   TextEditingController mobile = TextEditingController();

 DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Students',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  'Students Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: iD,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter ID',
                    labelText: 'ID',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: dob,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Date of Birth',
                    labelText: 'Date of Birth',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: mobile,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Mobile',
                    labelText: 'Mobile',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      AddDetails();
                      Navigator.pop(context);
                    },
                    child: const Text('Add details'),
                  ),
                ],),
              ],
            ),
          ),
        )
    );
  }
}


class AddDetails {
  late final int id;
  late final String name;
  late final String dob;
  late final String email;
  late final String mobile;
  final columns = ['id', 'name', 'dob', 'email', 'mobile'];
}
