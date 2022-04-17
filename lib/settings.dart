import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/userInfo/height/height-settings-screen.dart';
import 'package:project/userInfo/weight/weight-settings-screen.dart';
import 'package:project/welcome-screen.dart';
import 'package:project/workEd/workEd-screen.dart';

import 'calendar-screen.dart';
import 'createWorkout-screen.dart';
import 'home-screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}


class _SettingsScreen extends State<SettingsScreen> {


  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {


    Widget _buildWeightButton() {
      return SizedBox(
        height: 64,
        width: 400,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(6),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            child:  const Text(
              'Update Weight',
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WeightSettingsScreen();
              }));
            }
        ),
      );
    }

    Widget _buildLogOutButton() {
      return SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(6),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            child:  const Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            onPressed: () async {

              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut();

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WelcomeScreen();
              }));
            }
        ),
      );
    }

    Widget _buildHeightButton() {
      return SizedBox(
        height: 64,
        width: 400,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(6),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            child:  const Text(
              'Update Height',
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HeightSettingsScreen();
              }));
            }
        ),
      );
    }



    return  Scaffold(

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
              ],
            ),
          ),

          child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),

                const Text(
                    'Settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),

                Container(
                    alignment: Alignment.center,
                    child: const Padding(padding: EdgeInsets.only(top: 50),
                    )),
                const SizedBox(
                  height: 50,
                ),
                _buildWeightButton(),
                const SizedBox(
                  height: 30,
                ),
                _buildHeightButton(),

                const SizedBox(
                  height: 100,
                ),

                _buildLogOutButton()

              ]),


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

    );

  }


}
