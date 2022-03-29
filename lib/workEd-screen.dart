import 'package:flutter/material.dart';


class WorkEdScreen extends StatefulWidget {
  const WorkEdScreen({Key? key}) : super(key: key);

  @override
  State<WorkEdScreen> createState() => _WorkEdScreenState();
}


class _WorkEdScreenState extends State<WorkEdScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Workout Education"),
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        ),
        body: const Text(
            "WorkEd"
        )
    );
  }
}
