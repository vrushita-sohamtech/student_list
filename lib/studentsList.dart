import 'package:flutter/material.dart';
import 'package:student_list/database.dart';
import 'package:student_list/studentDetails.dart';

class AddStudents extends StatefulWidget {

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {

  late DbHelper dbHelper;

  final _userNameController = TextEditingController();
  final _userIDController = TextEditingController();
  final _userDobController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userMobileController = TextEditingController();


  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Students',),),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
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
                  controller: _userNameController,
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
                  controller: _userIDController,
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
                  controller: _userDobController,
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
                  controller: _userEmailController,
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
                  controller: _userMobileController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Mobile',
                    labelText: 'Mobile',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      dbHelper.insert(
                        StudentDetails(
                            id: 1,
                            name: 'riva',
                            dob: '23/08/2003',
                            email: 'riva@gmail.com',
                            mobile: '34767482',
                        ),
                      );
                      Navigator.pop(context);
                      // _userNameController.text = '';
                      // _userIDController.text = '';
                      // _userDobController.text = '';
                      // _userEmailController.text = '';
                      // _userMobileController.text = '';
                    },
                    child: Text('Add details'),
                  ),
                ],),
              ],
            ),
          ),
        )
    );
  }
}