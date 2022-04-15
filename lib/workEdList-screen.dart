
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd-screen.dart';
import 'package:project/workEdDetail-screen.dart';
import 'calendar-screen.dart';
import 'createWorkout-screen.dart';
import 'home-screen.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

class WorkEdList extends StatefulWidget{
  const WorkEdList({Key? key, required this.index }) : super(key: key);
  final String index;

  @override
  _WorkEdListState createState() => _WorkEdListState();
}

class _WorkEdListState extends State<WorkEdList>{
  int _currentIndex = 3;
  late var data;
  late final DatabaseReference _workoutRef = FirebaseDatabase.instance.ref().child('Workouts/${widget.index}');

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }


  void _activateListeners(){
    _workoutRef.onValue.listen((event) {
      setState(() {
        data = new Map<String, dynamic>.from(event.snapshot.value as Map);
      });
      log(data.toString());
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.index),
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {  },
          child: Flexible( child: FirebaseAnimatedList(query: _workoutRef, itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              Map workouts = snapshot.value as Map;

              return ListTile(title:  Text(snapshot.key.toString()),

                onTap:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkEdDetailScreen(data: data,)));

                      //  WorkEdDetailScreen(data: data["Pullup"] : this line of code needs to be changed were "pullup" is to a dynamic way of navigating to the detail page with the exercise
                  },
                );
            },
            )
          )
        )
      )
    );
  }
}

class WorkoutItem{
  final String name;
  final String url;
  final String targetGroups;
  final String description;

  WorkoutItem( this.url,  this.targetGroups,  this.description, this.name);


}
