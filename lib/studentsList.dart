import 'package:flutter/material.dart';
import 'package:student_list/database.dart';
import 'package:student_list/main.dart';
import 'package:student_list/studentDetails.dart';

class AddStudents extends StatefulWidget {

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {

   TextEditingController nameController = TextEditingController();
   TextEditingController idController = TextEditingController();
   TextEditingController dobController= TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController mobileController = TextEditingController();

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
                  controller: nameController,
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
                  controller: idController,
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
                  controller: dobController,
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
                  controller: emailController,
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
                  controller: mobileController,
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
                      backgroundColor: Colors.blueAccent,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      AddDetails();
                      Navigator.pop(context);
                      print('AddDetails');
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
  TextEditingController name = TextEditingController();
  TextEditingController iD = TextEditingController();
  TextEditingController dob= TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
}
