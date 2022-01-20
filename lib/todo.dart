import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {

  final String? text;
  final bool isDone;
  TodoWidget({this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: 26.0,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 25.0,
            height: 25.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: isDone ? Color(0xFF2e2f43) : Colors.transparent,
              border: isDone ? null : Border.all(color: Color(0xFF2e2f43), width: 2)
            ),
            child: Image(image: AssetImage("assets/images/check_icon.png")),
          ),
          Text(
            text ?? '(Unnamed toDo)',
            style: TextStyle(
              color: isDone ? Color(0xFF2e2f43) : Colors.black,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
