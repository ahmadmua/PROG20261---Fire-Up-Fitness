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

  Widget buildChips(int index) =>
      Wrap(children: widget.data['MusclesTargeted']);

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
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.all(25.0),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        //need to add something to ensure if the video is not there/present default or display a text that video is not there so page works rather than not
                        initialVideoId:
                            (YoutubePlayer.convertUrlToId(url) as String),
                        flags: const YoutubePlayerFlags(
                          enableCaption: false,
                          autoPlay: true,
                          hideControls: true,
                          forceHD: false,
                          loop: true,
                        )),
                  ),
                ),
                const Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.deepOrangeAccent,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    alignment: Alignment.centerLeft,
                    child: const Text("Targeted Muscle Groups:", style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),)),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: Text(
                      widget.data['MusclesTargeted'].toString(),
                      textAlign: TextAlign.left,
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(20, 35, 0, 5),
                    child: const Text("Description:",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent)  ,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 150,
                  width: 400,
                  padding: const EdgeInsets.all(4),
                  foregroundDecoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: Colors.deepOrangeAccent, ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text(
                      '${widget.data['description'].toString()}'),
                ),
              ],
            ),
          ),
        ));
  }
}
