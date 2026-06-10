import 'package:flutter/material.dart';
import 'package:flutter_test_two/modules/archived_tasks/archived_screen.dart';
import 'package:flutter_test_two/modules/done_tasks/done_tasks.dart';
import 'package:flutter_test_two/modules/new_tasks/new_task_screen.dart';
import 'package:flutter_test_two/shared/component/component.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

// 1. Create database
// 2. Create tables
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [NewTaskScreen(), DoneTasks(), ArchivedScreen()];

  List<String> appBar = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  @override
  void initState() {
    super.initState();
    createDataBase();
  }

  int currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData btmIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text(appBar[currentIndex])),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (isBottomSheetShown) {
            if (formKey.currentState!.validate()) {
              insertToDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
              ).then((value) {
                Navigator.pop(context);
                isBottomSheetShown = !isBottomSheetShown;
                setState(() {
                  btmIcon = Icons.edit;
                });
              });
            }
          } else {
            scaffoldKey.currentState?.showBottomSheet(
              (context) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadiusGeometry.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title text field
                      defaultTextField(
                        controller: titleController,
                        prefixIcon: Icon(Icons.title),
                        labelText: 'Task Title',
                        type: TextInputType.text,
                        function: (String? value) {
                          if (value!.isEmpty) {
                            return 'Title field can not be empty';
                          }
                          return null;
                        },
                        isPassword: false,
                      ),
                      SizedBox(height: 12),

                      // Time text field
                      defaultTextField(
                        onTap: () {
                          showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              )
                              .then((value) {
                                timeController.text = value!.format(context);
                              })
                              .catchError((e) {});
                        },
                        controller: timeController,
                        prefixIcon: Icon(Icons.timelapse),
                        labelText: 'Task Time',
                        type: TextInputType.number,
                        function: (String? value) {
                          if (value!.isEmpty) {
                            return 'Time field can not be empty';
                          }
                          return null;
                        },
                        isPassword: false,
                      ),
                      SizedBox(height: 12),

                      // Date text field
                      defaultTextField(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse("2026-07-10"),
                          ).then((value) {
                            dateController.text = DateFormat.yMMMd().format(
                              value!,
                            );
                          });
                        },
                        controller: dateController,
                        prefixIcon: Icon(Icons.date_range),
                        labelText: 'Task Date',
                        type: TextInputType.datetime,
                        function: (String? value) {
                          if (value!.isEmpty) {
                            return 'Date field can not be empty';
                          }
                          return null;
                        },
                        isPassword: false,
                      ),
                    ],
                  ),
                ),
              ),
            );
            isBottomSheetShown = !isBottomSheetShown;
            setState(() {
              btmIcon = Icons.add;
            });
          }
        },
        child: Icon(btmIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),
        ],
      ),

      body: screens[currentIndex],
    );
  }

  Future<String> getName() async {
    return 'Sami Abdelhalim';
  }

  late Database database;

  // Create DataBase with sqflite
  void createDataBase() async {
    database = await openDatabase(
      // .db to create file (extension)
      'todo.db',
      // version 1 => table 1
      version: 1,
      onCreate: (database, version) {
        // id INTEGER
        // title STRING
        // date STRING
        // time STRING
        // status STRING

        database
            .execute(
              // PRIMARY KEY => الداتا اللي بتكتبه او بتزوده
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
            )
            .then((value) {})
            .catchError((e) {});
      },

      onOpen: (database) {},
    );
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
            'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")',
          )
          .then((value) {
            print('$value inserted successfully');
          })
          .catchError((e) {});
      return null;
    });
  }
}
