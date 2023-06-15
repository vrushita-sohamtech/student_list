import 'package:flutter/material.dart';
import 'Student_info.dart';

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
      body: HomePage(),
    );
  }
}


