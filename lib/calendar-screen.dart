import 'package:flutter/material.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}


class _CalendarScreenState extends State<CalendarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Calendar"),
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        ),
        body: const Text(
            "Calendar"
        )
    );
  }
}
