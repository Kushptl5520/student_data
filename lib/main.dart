import 'package:flutter/material.dart';
import 'package:student_data/add_student.dart';
import 'package:student_data/edit_student.dart';
import 'package:student_data/student_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes:{
        "/" :(context) => StudentList(),
        "addStudent" : (context) => AddStudent(),
        "editStudent" :(context) => EditStudentList(),

      }
    );
  }
}