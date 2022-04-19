import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/home-screen.dart';
import 'package:project/login-screen.dart';
import 'package:project/register-screen.dart';
import 'package:project/userInfo/height/height-screen.dart';
import 'package:project/userInfo/weight/weight-screen.dart';
import 'welcome-screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return const MaterialApp(
      title: 'Fire Up Fitness',
      home: WelcomeScreen(),
    );
  }
}


