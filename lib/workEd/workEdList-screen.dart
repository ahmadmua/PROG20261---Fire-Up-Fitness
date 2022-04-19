
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd/workEd-screen.dart';
import 'package:project/workEd/workEdDetail-screen.dart';
import '../calendar-screen.dart';
import '../createWorkout-screen.dart';
import '../home-screen.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

class WorkEdList extends StatefulWidget{
  const WorkEdList({Key? key, required this.index }) : super(key: key);
  final String index;

  @override
  _WorkEdListState createState() => _WorkEdListState();
}

class _WorkEdListState extends State<WorkEdList>{
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
        data = Map<String, dynamic>.from(event.snapshot.value as Map);
      });
      log(data.toString());
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const WorkEdScreen();
          }));
        },
        ),
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
      body: Center(
        child: Flexible( child: FirebaseAnimatedList(query: _workoutRef, itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              return ListTile(title:  Text(snapshot.key.toString(),),

                onTap:() {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WorkEdDetailScreen(data: data[snapshot.key.toString()],)

                      ));
                  },
                );
            },
            )
          )
        )
      );
  }
}
