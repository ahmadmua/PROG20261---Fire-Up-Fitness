// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  int weight;
  Weight({Key? key, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          weight.toString(),
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}