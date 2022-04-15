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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TODO implement an IconButton that navigates to the WorkEd List screen
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
    body: Center(

      //TODO display all feilds being passed over within the data variable passed from the other page
      //TODO Milestone: Implement and embeded youtube player in the app to show video content from youtube

      child: Text(widget.data['name'].toString()),) ,
    );
  }
}
