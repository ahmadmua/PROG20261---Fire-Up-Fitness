import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/home-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEdList-screen.dart';
import 'calendar-screen.dart';
import 'createWorkout-screen.dart';

class WorkEdScreen extends StatefulWidget {
  const WorkEdScreen({Key? key}) : super(key: key);

  @override
  State<WorkEdScreen> createState() => _WorkEdScreenState();
}

class _WorkEdScreenState extends State<WorkEdScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 3;

  final List<String> _muscleGroupsList = [
    "Back & Biceps",
    "Chest & Triceps",
    "Front Legs",
    "Back Legs",
    "Shoulders",
    "Core",
  ];

  final List<String> _muscleGroupsListPictures = [
    "img1.jpg",
    "img4.jpg",
    "img2.jpg",
    "img6.jpg",
    "img3.jpg",
    "img5.jpg",
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
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ElevatedButton(
                  //TODO need to improve the style of the buttons
                  //perhaps add some images to the background of each button to give more of an appeal

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35))),
                  ),
                  child: Stack(
                    //used stack to add items on each other
                    children: [
                      Opacity(opacity: 0.5, child: Image.asset('assets/images/${_muscleGroupsListPictures[index].toString()}',colorBlendMode: BlendMode.softLight , color: Colors.orange, height: 175, width: 175 ,fit: BoxFit.fill,)),
                      Positioned.fill(child: Align(
                        alignment: Alignment.center,
                        child:  Text(_muscleGroupsList[index].toString(), style: TextStyle(fontSize: 20),),
                      ))
                    ],
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WorkEdList(
                        index: _muscleGroupsList[index].toString(),
                      );
                    }))
                  },
                );
              },
              childCount: _muscleGroupsList.length,
            ),
          ),
        ],
      ),
    );
  }
}
