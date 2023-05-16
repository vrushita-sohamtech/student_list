import 'package:flutter/material.dart';
import 'package:student_list/screens/studentsList.dart';

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
  const studentList({Key? key}) : super(key: key);

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
        title: Text('Student Details'),
        centerTitle: true,
      ),
      body: Center(child: Text('StudentsList'),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>AddStudents())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


