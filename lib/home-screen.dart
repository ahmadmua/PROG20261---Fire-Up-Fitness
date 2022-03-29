import 'package:flutter/material.dart';
import 'package:project/calendar-screen.dart';
import 'package:project/createWorkout-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/register-screen.dart';
import 'package:project/workEd-screen.dart';
import 'login-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
      ),
      body: GridView.count(
          crossAxisCount: 2,
        children: List.generate(4, (index){
          return Center(
            child:
            IconButton(
              icon: Image.asset('assets/images/logo.png'),
              iconSize: 190,
              onPressed: () {
                  if(index == 0){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const PedometerScreen();
                    }));
                  }
                  else if(index == 1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const CalendarScreen();
                    }));
                  }
                  else if(index == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const WorkEdScreen();
                    }));
                  }
                  else if(index == 3){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const CreateWorkoutScreen();
                    }));
                  }
              },
            ),
          );
        })
      )
    );
  }
}


// SafeArea(
// child: Stack(
// children: [
// Center(
// child: Container(
// height: 195.0,
// width: 195.0,
// margin: const EdgeInsets.all(20.0),
// decoration: BoxDecoration(
// border: Border.all(color: Colors.white, width: 5.0),
// borderRadius: BorderRadius.circular(10.0)
// ),
// child: const Image(
// image: NetworkImage(
// 'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=67773a9d419786091c958b2ad08eae5e'
// ),
// ),
// ),
// ),
// ],
// ),
// ),
