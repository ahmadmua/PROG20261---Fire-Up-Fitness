import 'package:flutter/material.dart';


class PedometerScreen extends StatefulWidget {
  const PedometerScreen({Key? key}) : super(key: key);

  @override
  State<PedometerScreen> createState() => _PedometerScreenState();
}


class _PedometerScreenState extends State<PedometerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Pedometer"),
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        ),
        body: const Text(
          "Pedometer"
        )
    );
  }
}
