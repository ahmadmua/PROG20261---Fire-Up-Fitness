import 'package:flutter/material.dart';


class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}


class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Create Workout"),
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        ),
        body: const Text(
            "CreaWork"
        )
    );
  }
}
