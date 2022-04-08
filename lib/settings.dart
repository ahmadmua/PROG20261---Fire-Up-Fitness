import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/register-screen.dart';
import 'package:project/userInfo/height/height-screen.dart';
import 'package:project/userInfo/weight/weight-screen.dart';
import 'package:project/welcome-screen.dart';
import 'login-screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}


class _SettingsScreen extends State<SettingsScreen> {


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
                return const WeightScreen();
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
                return const HeightScreen();
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


        ));

  }


}
