
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/settings.dart';

class WorkEdList extends StatefulWidget{
  const WorkEdList({Key? key}) : super(key: key);

  @override
  State<WorkEdList> createState() => _WorkEdListState();
}

class _WorkEdListState extends State<WorkEdList> with SingleTickerProviderStateMixin {






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(""),
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


    );
  }
}
