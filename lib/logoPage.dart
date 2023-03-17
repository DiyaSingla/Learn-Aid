import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'signin.dart';
import 'about_us.dart';

//this is in container
//                 width: 250,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(10),
//                 ),

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SignIn()));
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 43, 40, 41),
          Color.fromARGB(255, 105,102,103)
            ])
          ),
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/learnaidlogo.jpeg'),
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


