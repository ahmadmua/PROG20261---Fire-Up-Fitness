import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/home-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/settings.dart';
import 'package:project/workEd/workEd-screen.dart';
import 'package:project/workEd/workEdDetail-screen.dart';
import 'calendar-screen.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}


late DatabaseReference monday = FirebaseDatabase.instance.ref().child('');
late DatabaseReference tuesday = FirebaseDatabase.instance.ref().child('');
late DatabaseReference wednesday = FirebaseDatabase.instance.ref().child('');
late DatabaseReference thursday = FirebaseDatabase.instance.ref().child('');
late DatabaseReference friday = FirebaseDatabase.instance.ref().child('');

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  var weight = 0;
  var height = "";

  int _currentIndex = 2;

  late var data1;
  late var data2;
  late var data3;
  late var data4;
  late var data5;

  final List<String> _muscleGroupsList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];

  @override
  void initState() {
    super.initState();
    condition();
    _activateListeners();
  }

  void _activateListeners() {

    setState(() {

    monday.onValue.listen((event) {
      setState(() {
        data1 = Map<String, dynamic>.from(event.snapshot.value as Map);
        _muscleGroupsList;
      });
    });

    tuesday.onValue.listen((event) {
      setState(() {
        data2 = Map<String, dynamic>.from(event.snapshot.value as Map);
        _muscleGroupsList;
      });
    });

    wednesday.onValue.listen((event) {
      setState(() {
        data3 = Map<String, dynamic>.from(event.snapshot.value as Map);
        _muscleGroupsList;
      });
    });

    thursday.onValue.listen((event) {
      setState(() {
        data4 = Map<String, dynamic>.from(event.snapshot.value as Map);
        _muscleGroupsList;
      });
    });

    friday.onValue.listen((event) {
      setState(() {
        data5 = Map<String, dynamic>.from(event.snapshot.value as Map);
        _muscleGroupsList;
      });
    });

    });

  }

  void condition() {
    final User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('UserData')
        .doc(user?.uid)
        .get()
        .then((value) => weight = value.data()?['weight']);

    FirebaseFirestore.instance
        .collection('UserData')
        .doc(user?.uid)
        .get()
        .then((value) => height = value.data()?['height']);

    if (weight == 100) {

      monday = FirebaseDatabase.instance
          .ref()
          .child('Plan1/${_muscleGroupsList[0]}');

      tuesday = FirebaseDatabase.instance
          .ref()
          .child('Plan1/${_muscleGroupsList[1]}');

      wednesday = FirebaseDatabase.instance
          .ref()
          .child('Plan1/${_muscleGroupsList[2]}');

      thursday = FirebaseDatabase.instance
          .ref()
          .child('Plan1/${_muscleGroupsList[3]}');

      friday = FirebaseDatabase.instance
          .ref()
          .child('Plan1/${_muscleGroupsList[4]}');

    } else if(weight > 100){

      monday = FirebaseDatabase.instance
          .ref()
          .child('Plan2/${_muscleGroupsList[0]}');

      tuesday = FirebaseDatabase.instance
          .ref()
          .child('Plan2/${_muscleGroupsList[1]}');

      wednesday = FirebaseDatabase.instance
          .ref()
          .child('Plan2/${_muscleGroupsList[2]}');

      thursday = FirebaseDatabase.instance
          .ref()
          .child('Plan2/${_muscleGroupsList[3]}');

      friday = FirebaseDatabase.instance
          .ref()
          .child('Plan2/${_muscleGroupsList[4]}');

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        title: const Text("Workout Plan"),
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
      body:
          SingleChildScrollView(child:

      Column(children: [

      ExpansionTile(title: const Text("Monday - Back & Biceps", style: TextStyle(fontSize: 25)), children: [

      FirebaseAnimatedList(
        shrinkWrap: true,
        query: monday,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {

          condition();

            return ListTile(
              title: Text(snapshot.key.toString()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkEdDetailScreen(
                            data: data1[snapshot.key.toString()])));
              },
            );
        },
      ),
    ]),

    ExpansionTile(title: const Text("Tuesday - Chest & Triceps", style: TextStyle(fontSize: 25)), children: [
        FirebaseAnimatedList(
          shrinkWrap: true,
          query: tuesday,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {


              return ListTile(
                title: Text(snapshot.key.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkEdDetailScreen(
                              data: data2[snapshot.key.toString()])));
                },
              );
          },
        ),
    ]),

        ExpansionTile(title: const Text("Wednesday - Legs", style: TextStyle(fontSize: 25)), children: [
          FirebaseAnimatedList(
            shrinkWrap: true,
            query: wednesday,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {


              return ListTile(
                title: Text(snapshot.key.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkEdDetailScreen(
                              data: data3[snapshot.key.toString()])));
                },
              );
            },
          ),
        ]),

        ExpansionTile(title: const Text("Thursday - Shoulders", style: TextStyle(fontSize: 25)), children: [
          FirebaseAnimatedList(
            shrinkWrap: true,
            query: thursday,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {


              return ListTile(
                title: Text(snapshot.key.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkEdDetailScreen(
                              data: data4[snapshot.key.toString()])));
                },
              );
            },
          ),
        ]),

        ExpansionTile(title: const Text("Friday - Core", style: TextStyle(fontSize: 25)), children: [

          FirebaseAnimatedList(
            shrinkWrap: true,
            query: friday,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {


              return ListTile(
                title: Text(snapshot.key.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkEdDetailScreen(
                              data: data5[snapshot.key.toString()])));
                },
              );
            },
          ),
        ])

          ])
          )
    );
  }
}
