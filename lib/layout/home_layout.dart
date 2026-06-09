import 'package:flutter/material.dart';
import 'package:flutter_test_two/modules/archived_tasks/archived_screen.dart';
import 'package:flutter_test_two/modules/done_tasks/done_tasks.dart';
import 'package:flutter_test_two/modules/new_tasks/new_task_screen.dart';
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBar[currentIndex])),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {

            var name = await getName();
            print(name);
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.add),
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

  // Create DataBase with sqflite
  void createDataBase() async {
    var database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version){
        print('Database is Created');
      },
      onOpen: (database){
        print('Database is Opened');

      },
    );
  }
}
