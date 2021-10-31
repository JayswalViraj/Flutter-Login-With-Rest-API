import 'package:flutter/material.dart';

class Failed extends StatefulWidget {
  const Failed({Key? key}) : super(key: key);

  @override
  _FailedState createState() => _FailedState();
}

class _FailedState extends State<Failed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.red,
            child: Text("Failed"),
          ),
        ),
      ),
    );
  }
}
