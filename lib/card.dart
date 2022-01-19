import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String? title;
  TaskCard({this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          title ?? "(Unnamed task)",
          style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
          'Welcome to this app, try adding some cards or editing existing cards',
          style: TextStyle(
            fontSize: 16,
            height: 1.5

          ),
        ),
        ),
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
       ),
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0, 
      ),
    );
  }
}