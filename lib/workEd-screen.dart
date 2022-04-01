import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/home-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'calendar-screen.dart';
import 'createWorkout-screen.dart';


class WorkEdScreen extends StatefulWidget {
  const WorkEdScreen({Key? key}) : super(key: key);

  @override
  State<WorkEdScreen> createState() => _WorkEdScreenState();
}


class _WorkEdScreenState extends State<WorkEdScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Workout Education"),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            }
            else if(value == 1){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CalendarScreen();
              }));
            }
            else if(value == 2){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CreateWorkoutScreen();
              }));
            }
            else if(value == 3){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WorkEdScreen();
              }));
            }
            else if(value == 4){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
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
              icon: FaIcon(FontAwesomeIcons.shoePrints),
            ),
          ],
        ),
        body: const Text(
            "WorkEd"
        )
    );
  }
}
