import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd-screen.dart';

import 'calendar-screen.dart';
import 'createWorkout-screen.dart';
import 'home-screen.dart';

class WorkEdDetailScreen extends StatefulWidget {
  const WorkEdDetailScreen({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<WorkEdDetailScreen> createState() => _WorkEdDetailScreenState();
}

class _WorkEdDetailScreenState extends State<WorkEdDetailScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.data['name'].toString()),
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
              icon: Icon(FontAwesomeIcons.personWalking),
            ),
          ],
        ),
    body: const Center(child: Text("yo"),) ,
    );
  }
}
