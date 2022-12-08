import 'package:flutter/material.dart';
import 'package:student_data/database/db_helper.dart';
import 'package:student_data/models/student_model.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
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
    queryall();
  }

  void queryall() async {
    final allRows = await dbHelper.queryall();
    studentList.clear();
    allRows.forEach((row) => studentList.add(StudentModel.fromMap(row)));
    print(allRows.length);
    setState(() {});
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
              "Add Student",
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
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
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
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
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
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
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
                        prefixIcon: Icon(
                          Icons.class_,
                          color: Colors.white,
                        ),
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
                        prefixIcon: Icon(
                          Icons.phone_in_talk,
                          color: Colors.white,
                        ),
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
                        prefixIcon: Icon(
                          Icons.create_outlined,
                          color: Colors.white,
                        ),
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
                      child: Text(
                        "Subject :",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
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
                        onPressed: (() {}),
                        // onPressed: () {
                        // String? name = namecontroller.text;
                        // String? email = emailcontroller.text;
                        // String? address = addresscontroller.text;
                        // String? classno = classnocontroller.text;
                        // String? hobby = hobbycontroller.text;
                        // String? subject = selectedSubject.toString();
                        // insertdata(name, email, address, classno, hobby, subject);
                        // },
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
                          "Submit",
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
      popup(context, "Warning", "Please Enter Email");
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
      popup(context, "Warning", "Please Enter Hobby");
    } else if (selectedSubject.isEmpty) {
      popup(context, "Warning", "Please Select Subject");
    }
    else {
      var isEmailExist = studentList
          .where((element) => element.email == emailcontroller.text.toString());
      var isPhoneExist = studentList
          .where((element) => element.phoneno == phonenocontoller.text.toString());

      if (isEmailExist.isNotEmpty) {
        popup(context, "Warning",
            "Email already exist. Please use another email to create student");
      }
      else if(isPhoneExist.isNotEmpty){
        popup(context, "Warning",
            "Phoneno already exist. Please use another phoneno to create student");
      }
      else {
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
                            setState(() {
                              insertdata(
                                  namecontroller.text,
                                  emailcontroller.text,
                                  addresscontroller.text,
                                  classnocontroller.text,
                                  phonenocontoller.text,
                                  hobbycontroller.text,
                                  selectedSubject.toString());
                              Navigator.of(context).pushNamed("/");
                              showToast(
                                  context, 'Details Submitted Successfully');
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 40)),
                          ),
                          child: Text("OK",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
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
                                // decoration: BoxDecoration(
                                //     color: Colors.teal,
                                //     borderRadius: BorderRadius.circular(30)),
                                // child: Icon(
                                //   Icons.done,
                                //   color: Colors.white,
                                //   size: 48,
                                // ),
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/like.gif",
                                  ),
                                  height: 80,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Submitted",
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
                                "Thank You",
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
    }
  }

  void insertdata(
      name, email, address, classno, phoneno, hobby, subject) async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: name,
      Databasehelper.columnEmail: email,
      Databasehelper.columnAddress: address,
      Databasehelper.columnClassno: classno,
      Databasehelper.columnPhoneno: phoneno,
      Databasehelper.columnHobby: hobby,
      Databasehelper.columnSubject: subject,
    };

    // var student = StudentModel(id, name, email, address, classno, hobby, subject);
    StudentModel studentModel = StudentModel.fromMap(row);
    final id = await dbHelper.insert(studentModel);
    print(id);
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
}
