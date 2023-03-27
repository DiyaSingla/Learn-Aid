import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ngo_second_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'write_ngodata.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.email});
  final String email;

  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  WriteNgoData w = WriteNgoData();

  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email = "", password = "";
  int _selectedValue = 0;
  String ngoName = '';
  String ph = '';
  String add1 = '';
  String add2 = '';

  /*Future createUser(NgoUser1 user)async {
      final docUser = FirebaseFirestore.instance.collection('NgoUser1').doc();
      final user = NgoUser1(
        id : docUser.id,
        name : ngoName,
        phone : ph,
        add1 : add1,
        add2 : add2,
      );
      final json = user.toJson();
      await docUser.set(json);
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFA1D2CE),
        appBar: AppBar(
          // backgroundColor: const Color(0xFF62A8AC),
          backgroundColor: Color(0xff4a4a4a),
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'NGO Registration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Alkalami",
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  1, MediaQuery.of(context).size.height * 0.1, 1, 0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "images/ngopic.png",
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //Starting from here
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    setState(() {
                      ngoName = value;
                    });
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Name of NGO',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    setState(() {
                      ngoName = value;
                    });
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    setState(() {
                      add1 = value;
                    });
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Office Address Line 1',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    setState(() {
                      add2 = value;
                    });
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Office Address Line 2',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
            ],
          ),
        ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 10.0,
          width: 10.0,
        ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Saved",
          child: const Text('Next'),
          onPressed: () {  

           final user = WriteNgoData(
              name : ngoName,
              phone : ph,
              add1 : add1,
              add2 : add2,
              numcls1: '',
              numcls2: '',
              numcls3: '',
              numcls4: '',
              numcls5: '',
              hrto: '',
              hrfrom: '',
              selectedClass: '',
            );
            w.createUserNgo(user);
                   
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NextNGOPage(ID : w.id)),
            );
          },
          
        ),
      ),
    );
  }
}

 