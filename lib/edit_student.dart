import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_data/database/db_helper.dart';
import 'package:student_data/models/student_model.dart';

class EditStudentList extends StatefulWidget {
  StudentModel? studentModel;

  EditStudentList({
    Key? key,
    this.studentModel,
  }) : super(key: key);

  @override
  State<EditStudentList> createState() => _EditStudentListState();
}

class _EditStudentListState extends State<EditStudentList> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonenocontoller = TextEditingController();
  TextEditingController classnocontroller = TextEditingController();
  TextEditingController hobbycontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();

  bool? _isChecked = false;
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;

  String? subject = '';

  List<String> selectedSubject = [];
  List<StudentModel> studentList = [];

  final dbHelper = Databasehelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namecontroller.text = widget.studentModel!.name.toString();
    emailcontroller.text = widget.studentModel!.email.toString();
    addresscontroller.text = widget.studentModel!.address.toString();
    classnocontroller.text = widget.studentModel!.classno.toString();
    phonenocontoller.text = widget.studentModel!.phoneno.toString();
    hobbycontroller.text = widget.studentModel!.hobby.toString();

    if (widget.studentModel!.subject!.contains("Physics")) {
      _isChecked = true;
    }
    if (widget.studentModel!.subject!.contains("Maths")) {
      _isChecked1 = true;
    }
    if (widget.studentModel!.subject!.contains("Biology")) {
      _isChecked2 = true;
    }
    if (widget.studentModel!.subject!.contains("English")) {
      _isChecked3 = true;
    }
    queryall();
    setState(() {});
  }

  void queryall() async {
    final allRows = await dbHelper.queryall();
    studentList.clear();
    allRows.forEach((row) => studentList.add(StudentModel.fromMap(row)));
    print(allRows.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0C1024),
            title: Text(
              "Edit Student",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(color: Colors.white),
                    controller: namecontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    controller: emailcontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Email",
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    controller: addresscontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        counterText: '',
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Enter Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: classnocontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Class No",
                        labelText: "Class No",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    controller: phonenocontoller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Phone No",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Enter Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: hobbycontroller,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Hobby Name",
                        labelText: "Hobby",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Subject :",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            side: BorderSide(color: Colors.white),
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value;
                                subject = "Physics";
                                if (_isChecked = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            }),
                        Expanded(
                          child: Text(
                            "Physics",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Checkbox(
                            side: BorderSide(color: Colors.white),
                            value: _isChecked1,
                            onChanged: (value) {
                              setState(() {
                                _isChecked1 = value;
                                subject = "Maths";
                                if (_isChecked1 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            }),
                        Expanded(
                          child: Text(
                            "Maths",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            side: BorderSide(color: Colors.white),
                            value: _isChecked2,
                            onChanged: (value) {
                              setState(() {
                                _isChecked2 = value;
                                subject = "Biology";
                                if (_isChecked2 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            }),
                        Expanded(
                          child: Text(
                            "Biology",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Checkbox(
                            side: BorderSide(color: Colors.white),
                            value: _isChecked3,
                            onChanged: (value) {
                              setState(() {
                                _isChecked3 = value;
                                subject = "English";
                                if (_isChecked3 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            }),
                        Expanded(
                          child: Text(
                            "English",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        child: Text(
                          "Cancle",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.white12.withOpacity(0.15)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 50)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => moveToHome(context),
                        // if(checkValidation()){
                        //   moveToHome(context);
                        // }

                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.white12.withOpacity(0.15)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 50)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ]),
            ),
          )),
    );
  }

  moveToHome(BuildContext context) {
    if (namecontroller.text.trim().isEmpty) {
      popup(context, "Warning", "Please Enter Name");
    } else if (emailcontroller.text.trim().isEmpty) {
      popup(context, "Warning", "Plase Enter Eamil");
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailcontroller.text)) {
      popup(context, "Warning", "Please Enter Valid Email");
    } else if (addresscontroller.text.trim().isEmpty) {
      popup(context, "Warning", "Please Enter Address");
    } else if (classnocontroller.text.trim().isEmpty) {
      popup(context, "Warning", "Please Enter ClassNo");
    } else if (phonenocontoller.text.trim().isEmpty) {
      popup(context, "Warning", "Please Enter PhoneNo");
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{6,10}$)')
        .hasMatch(phonenocontoller.text)) {
      popup(context, "Warning", "Please Enter Valid PhoneNo");
    } else if (hobbycontroller.text.trim().isEmpty) {
      popup(context, "Warning", "Please Enater Hobby");
    } else if (selectedSubject.isEmpty) {
      popup(context, "Warning", "Please Select Subject");
    } else {
      var isEmailExist = studentList
          .where((element) => element.email == emailcontroller.text.toString());
      var isPhoneExist = studentList.where(
          (element) => element.phoneno == phonenocontoller.text.toString());

      if (isEmailExist.isNotEmpty) {
        popup(context, "Warning",
            "Email already exist. Please use another email to create student");
      } else if (isPhoneExist.isNotEmpty) {
        popup(context, "Warning",
            "Phoneno already exist. Please use another phoneno to create student");
      } else {
        updatedata(
            namecontroller.text,
            emailcontroller.text,
            addresscontroller.text,
            classnocontroller.text,
            phonenocontoller.text,
            hobbycontroller.text,
            selectedSubject.toString());

        popupbox(context, "Updated", "Thank You");
      }
    }
  }

  void updatedata(
      name, email, address, classno, phoneno, hobby, subject) async {
    Map<String, dynamic> row = {
      Databasehelper.columnID: widget.studentModel!.id,
      Databasehelper.columnName: name,
      Databasehelper.columnEmail: email,
      Databasehelper.columnAddress: address,
      Databasehelper.columnClassno: classno,
      Databasehelper.columnPhoneno: phoneno,
      Databasehelper.columnHobby: hobby,
      Databasehelper.columnSubject: selectedSubject.toString(),
    };

    // var student = StudentModel(id, name, email, address, classno, hobby, subject);
    StudentModel studentModel = StudentModel.fromMap(row);
    final id = await dbHelper.update(studentModel);
    print(id);
  }
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(milliseconds: 700),
    ),
  );
}

void popup(BuildContext context, String title, String subtitte) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(8),
          elevation: 10,
          titlePadding: const EdgeInsets.all(0.0),
          title: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                            "assets/images/warning.gif",
                          ),
                          height: 65,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          subtitte,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

void popupbox(BuildContext context, String tittle, String subtittle) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                      showToast(context, 'Details Update Successfully');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 40)),
                    ),
                    child: Text("OK", style: TextStyle(color: Colors.white))),
              ],
            ),
          ],
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(8),
          elevation: 10,
          titlePadding: const EdgeInsets.all(0.0),
          title: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage(
                              "assets/images/update.gif",
                            ),
                            height: 65,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          tittle,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          subtittle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
