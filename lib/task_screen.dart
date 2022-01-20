import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl_flutter_app/database_helper.dart';
import 'package:intl_flutter_app/todo.dart';

import 'models/task.dart';

class TaskScreen extends StatefulWidget {
  final int? id;
  final Task? task;
  TaskScreen({this.id, this.task});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String? _taskTitle = "";
  @override
  void initState() {
    if(widget.task != null){
      _taskTitle = widget.task?.title;
    }
    print("ID: ${widget.task?.id}");
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF2e2f43),
        //   title: Text(t!.appBarTitle), // Using the translation generated by the AppLocalization class imported on top of this script
        // ),
        body: SafeArea(
      child: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image(
                            image:
                                AssetImage("assets/images/back_arrow_icon.png"),
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        onSubmitted: (value) async {
                          //lets check if field is not empty
                          if (value != "") {
                            //check is the task is null
                            if (widget.task == null) {
                              DatabaseHelper _dbhelper = DatabaseHelper();
                              Task _newTask = Task(title: value);
                              await _dbhelper.insertTask(_newTask);

                              print("The task has been created");
                            } else {
                              print('gonna update existing task');
                            }
                          }
                        },
                        controller: TextEditingController()..text = _taskTitle!,
                        decoration: InputDecoration(
                          hintText: t!.taskTitleTextAreaHint,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2e2f43)),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: t.taskDescriptionTextAreaHint,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24.0)),
                  ),
                ),
                TodoWidget(
                  text: 'Sacar la basura',
                  isDone: true,
                ),
                TodoWidget(
                  text: 'Pasear al perro',
                  isDone: true,
                ),
                TodoWidget(
                  isDone: false,
                ),
                TodoWidget(
                  isDone: false,
                )
              ],
            ),
            Positioned(
              /// Floating action button
              bottom: 20.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskScreen(
                                id: 0,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffd62828),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image(
                    width: 60,
                    height: 60,
                    image: AssetImage("assets/images/delete_icon.png"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
