import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/home-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd/workEdList-screen.dart';
import '../calendar-screen.dart';
import '../createWorkout-screen.dart';

class WorkEdScreen extends StatefulWidget {
  const WorkEdScreen({Key? key}) : super(key: key);

  @override
  State<WorkEdScreen> createState() => _WorkEdScreenState();
}

class _WorkEdScreenState extends State<WorkEdScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 3;

  final List<String> _muscleGroupsList = [
    "Back & Biceps",
    "Chest & Triceps",
    "Front Legs",
    "Back Legs",
    "Shoulders",
    "Core",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Workout Education"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingsScreen();
              }));
            },
          )
        ],
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
          if (value == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }));
          } else if (value == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const CalendarScreen();
            }));
          } else if (value == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const CreateWorkoutScreen();
            }));
          } else if (value == 3) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const WorkEdScreen();
            }));
          } else if (value == 4) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
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
            label: ('Workout Plan'),
            icon: Icon(Icons.whatshot),
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
      body: CustomScrollView(
        slivers: <Widget>[SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return ElevatedButton(

                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                ),
                child: Text(_muscleGroupsList[index],style: const TextStyle(fontSize: 20)),
                onPressed: () => {

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WorkEdList(index: _muscleGroupsList[index].toString(), );
                }
                ))},
              );
            },
            childCount: _muscleGroupsList.length,
          ),
          ),
        ],
      ) ,
    );
  }
}
