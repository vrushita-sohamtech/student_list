import 'package:flutter/material.dart';
import 'package:student_list/studentDetails.dart';

class detail extends StatelessWidget {
  final StudentDetails student;
  const detail({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Detail'),
      ),
      body: Padding(padding: EdgeInsets.all(10),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('id',
          style: TextStyle(
            fontSize: 18,
          ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(student.id.toString()),
          const Text('name',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(student.name),
          const Text('dob',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(student.dob),
          const Text('email',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(student.email),
          const Text('mobile',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(student.mobile),
        ],
      ),
      ),
    );
  }
}


