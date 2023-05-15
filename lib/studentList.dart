import 'package:flutter/material.dart';

class studentList extends StatefulWidget {
  const studentList({Key? key}) : super(key: key);

  @override
  State<studentList> createState() => _studentListState();
}

class _studentListState extends State<studentList> {
  List<String> students = [
    'Daisy',
    'Rio',
    'Nency',
    'Riva',
    'Riya',
    'Mishti',
    'Neel',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Students'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                      ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

