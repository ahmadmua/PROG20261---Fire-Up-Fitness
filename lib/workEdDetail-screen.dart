import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd-screen.dart';
import 'package:project/workEdList-screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'calendar-screen.dart';
import 'createWorkout-screen.dart';
import 'home-screen.dart';

class WorkEdDetailScreen extends StatefulWidget {
  const WorkEdDetailScreen({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<WorkEdDetailScreen> createState() => _WorkEdDetailScreenState();
}

class _WorkEdDetailScreenState extends State<WorkEdDetailScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController videoController;
  late var url = (widget.data['url'].toString());



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WorkEdList(index: widget.data['parent']);
            }));
          },
        ),
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
      body: SingleChildScrollView(
        child: Center(
          //TODO display all feilds being passed over within the data variable passed from the other page
          //TODO Milestone: Implement and embeded youtube player in the app to show video content from youtube

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.0),
                padding:EdgeInsets.all(25.0) ,
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    //need to add something to ensure if the video is not there/present default or display a text that video is not there so page works rather than not
                      initialVideoId: (YoutubePlayer.convertUrlToId(url) as String),
                      flags: YoutubePlayerFlags(enableCaption: false, autoPlay: true, hideControls: true, forceHD: false, loop: true,)),
                ) ,
              ),
              Text(widget.data['targetGroups'].toString()),
              Text('Description: ${widget.data['description'].toString()}')
            ],
          ),
        ),
      )
    );
  }
}
