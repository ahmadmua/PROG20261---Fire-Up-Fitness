import 'package:flutter/material.dart';
import 'package:project/calendar-screen.dart';
import 'package:project/createWorkout-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/register-screen.dart';
import 'package:project/workEd-screen.dart';
import 'login-screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
      ),
      body: Row(children: [
        Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            IconButton(
              icon: const Icon(Icons.add),
              color: const Color.fromRGBO(103, 71, 255, 1.0),
              iconSize: 190,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CreateWorkoutScreen();
                }));
              },
            ),
            const Text("Add Workout", style: TextStyle(fontSize: 25)),
            IconButton(
              icon: const Icon(Icons.fitness_center),
              iconSize: 190,
              color: const Color.fromRGBO(103, 71, 255, 1.0),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WorkEdScreen();
                }));
              },
            ),
            const Text("Workout", style: TextStyle(fontSize: 25)),
            const Text("Education", style: TextStyle(fontSize: 25)),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            IconButton(
              icon: const Icon(Icons.calendar_month),
              iconSize: 190,
              color: const Color.fromRGBO(103, 71, 255, 1.0),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalendarScreen();
                }));
              },
            ),
            const Text("Calendar", style: TextStyle(fontSize: 25)),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.personWalking),
              iconSize: 190,
              color: const Color.fromRGBO(103, 71, 255, 1.0),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PedometerScreen();
                }));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Pedometer", style: TextStyle(fontSize: 25)),
          ],
        ),
      ]),
    );
  }
}
