import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/home-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd-screen.dart';
import 'createWorkout-screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}


class _CalendarScreenState extends State<CalendarScreen> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingsScreen();
              }));
            },
          )],
          title: const Text("Calendar"),
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            if(value == 0){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            }
            else if(value == 1){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const CalendarScreen();
              }));
            }
            else if(value == 2){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const CreateWorkoutScreen();
              }));
            }
            else if(value == 3){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const WorkEdScreen();
              }));
            }
            else if(value == 4){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const PedometerScreen();
              }));
            }
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              label: ('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: ('Calendar'),
              icon: Icon(Icons.calendar_month),
            ),
            BottomNavigationBarItem(
              label: ('Add Workout'),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: ('Exercises'),
              icon: Icon(Icons.fitness_center),
            ),
            BottomNavigationBarItem(
              label: ('Pedometer'),
              icon: FaIcon(FontAwesomeIcons.personWalking),
            ),
          ],
        ),
        body: const Text(
            "Calendar"
        )
    );
  }
}
