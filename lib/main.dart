import 'package:flutter/material.dart';
import 'package:student_list/database.dart';
import 'package:student_list/studentDetails.dart';
import 'package:student_list/studentsList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: studentList(),
    );
  }
}

class studentList extends StatefulWidget {

  @override
  State<studentList> createState() => _studentListState();
}

class _studentListState extends State<studentList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        height: 100,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=> AddStudents())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


