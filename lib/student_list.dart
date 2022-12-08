import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:student_data/database/db_helper.dart';
import 'package:student_data/edit_student.dart';
import 'models/student_model.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final dbHelper = Databasehelper.instance;
  List<StudentModel> studentModel = [];
  bool isVisible = false;

  bool _show = true;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queryall();
    handleScroll();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 1,
              backgroundColor: Color(0xFF0C1024),
              title:
                  Text("Student List", style: TextStyle(color: Colors.white)),
              centerTitle: true,
              actions: [
                studentModel.isEmpty
                    ? Text('')
                    : IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Please Confirm"),
                              content: Text("Are you sure you want to delete?"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(
                                    "Cancle",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.indigo),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(horizontal: 20)),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      deleteAll();
                                      studentModel.clear();
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.indigo),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(horizontal: 20)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        )),
              ],
              automaticallyImplyLeading: false,
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover)),
              child: studentModel.isEmpty
                  ? Center(
                      child: Text(
                        'Nothing To Show',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: studentModel.length,
                      itemBuilder: (context, index) {
                        var item = studentModel[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 2),
                          child: Slidable(
                            startActionPane: ActionPane(
                              motion: StretchMotion(),
                              children: [
                                SlidableAction(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  label: "Edit",
                                  icon: Icons.edit,
                                  backgroundColor:
                                      Colors.green.withOpacity(0.25),
                                  onPressed: (context) {
                                    dbHelper.update(item);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                EditStudentList(
                                                    studentModel: item)))
                                        .then((value) {
                                      if (value != null && value!) {
                                        setState(() {
                                          queryall();
                                        });
                                      }
                                    });
                                  },
                                )
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: DrawerMotion(),
                              children: [
                                SlidableAction(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  label: "Delete",
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red.withOpacity(0.25),
                                  onPressed: (context) => {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Please Confirm"),
                                        content: Text(
                                            "Are you sure you want to #${item.id!} delete?"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text(
                                              "Cancle",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.indigo),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20)),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                Databasehelper.instance.delete(
                                                    studentModel[index].id!);
                                                studentModel.removeAt(index).id;
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.indigo),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  },
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.15),
                                        Colors.white.withOpacity(0.25),
                                      ]),
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.white30.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ID: ' +
                                                  studentModel[index]
                                                      .id
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyy')
                                                  .format(DateTime.now()),
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ]),
                                      Text(
                                        'Name: ' +
                                            studentModel[index].name.toString(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Email: ' +
                                            studentModel[index]
                                                .email
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Address: ' +
                                            studentModel[index]
                                                .address
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Class No: ' +
                                            studentModel[index]
                                                .classno
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Phone No: ' +
                                            studentModel[index]
                                                .phoneno
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Hobby: ' +
                                            studentModel[index]
                                                .hobby
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Text(
                                        'Subject: ' +
                                            studentModel[index]
                                                .subject
                                                .toString()
                                                .replaceAll('[', '')
                                                .replaceAll(']', ''),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
            floatingActionButton: Visibility(
              visible: _show,
              child: FloatingActionButton(
                backgroundColor: Colors.white30.withOpacity(0.20),
                child: Icon(Icons.add,size: 30,),
                onPressed: (() {
                  Navigator.pushNamed(context, "addStudent");
                }),
              ),
            )));
  }

  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloationButton() {
    setState(() {
      _show = true;
    });
  }

  void hideFloationButton() {
    setState(() {
      _show = false;
    });
  }

  void deleteAll() async {
    dbHelper.deleteAll();
  }

  void handleScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloationButton();
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloationButton();
      }
    });
  }

  void queryall() async {
    final allRows = await dbHelper.queryall();
    studentModel.clear();
    allRows.forEach((row) => studentModel.add(StudentModel.fromMap(row)));
    print(allRows.length);
    setState(() {});
  }

  void delete() async {
    var id = await dbHelper.delete(1);
    print(id);
  }
}
