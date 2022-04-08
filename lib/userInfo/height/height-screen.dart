import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/home-screen.dart';
import 'package:project/login-screen.dart';
import 'package:project/userInfo/weight/weight.dart';

import 'height.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreen();
}

class _HeightScreen extends State<HeightScreen> {

   final FixedExtentScrollController _controller = FixedExtentScrollController();

  int foot = 0;
  int inches = 0;
  late String height = foot.toString() + inches.toString();


  @override
  Widget build(BuildContext context) {

    Widget _buildButton() {
      return SizedBox(
          height: 64,
          width: double.infinity,
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
              onPressed: () {
                final User? user = FirebaseAuth.instance.currentUser;
                FirebaseFirestore.instance.collection('UserData').doc(user?.uid).update({"height": height}).then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                });
              },

              child: const Text(
                'Continue',
                style: TextStyle(
                  fontFamily: 'PT-Sans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )));
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
      body: Center(child: Column(children: <Widget>[
        const SizedBox(
          width: 500,
          height: 120,
        ),
        const Flexible(
          child: Text(
            'Enter your height',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),


        const SizedBox(
          height:60,
        ),

        Flexible(
                 child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (index)=>
                      setState(() {
                        foot = index;
                      }),
                  controller: _controller,
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.1,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 8,
                      builder: (context, index) {
                        return Height(
                          height: index,
                        );
                      }),
                 )),

        const SizedBox(
          height: 70,
        ),

              Flexible(

              child: ListWheelScrollView.useDelegate(
                onSelectedItemChanged: (index)=>
                    setState(() {
                      inches = index;
                    }),
                controller: _controller,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.1,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 12,
                    builder: (context, index) {
                      return Weight(
                        weight: index,
                      );
                    }),
              ),

            ),

         const SizedBox(
          height: 70,
        ),

        Flexible(child: Text(
            "Selected Height: $foot' $inches\"",
            style: const TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 35,
              color: Colors.white,
            )
        ),
        ),

        const SizedBox(
          height: 100,
        ),

        _buildButton(),

        const SizedBox(
          height: 70,
        ),
      ],
    )
    )
    );
  }
}
