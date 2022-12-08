import 'package:student_data/database/db_helper.dart';

class StudentModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? classno;
  String? phoneno;
  String? hobby;
  String? subject;

  StudentModel(this.id, this.name, this.email, this.address, this.classno,
      this.phoneno, this.hobby, this.subject);

  StudentModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    address = map['address'];
    classno = map['classno'];
    phoneno = map['phoneno'];
    hobby = map['hobby'];
    subject = map['subject'];
  }

  Map<String, Object?> toMap() => {
        Databasehelper.columnID: id,
        Databasehelper.columnName: name,
        Databasehelper.columnEmail: email,
        Databasehelper.columnAddress: address,
        Databasehelper.columnClassno: classno,
        Databasehelper.columnPhoneno: phoneno,
        Databasehelper.columnHobby: hobby,
        Databasehelper.columnSubject: subject
      };
}
