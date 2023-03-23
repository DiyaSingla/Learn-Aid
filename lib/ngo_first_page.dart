import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ngo_second_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  final controllerName = TextEditingController();
  final controllerPh = TextEditingController();
  final controllerAdd1 = TextEditingController();
  final controllerAdd2 = TextEditingController();
  
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email="", password="";
  int _selectedValue = 0;
  String ngoName = '';
  String ph = '';
  //String _email = '';
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
          backgroundColor: const Color(0xFF62A8AC),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Image.network(
                  "https://corpbiz.io/learning/wp-content/uploads/2019/11/NGO-Registration.jpg",
                  width: 400,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //Starting from here
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: TextField(
                  controller : controllerName,
                  onChanged: (value) {
                    // store the value entered in the text field
                    ngoName = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Name of NGO',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller : controllerPh,
                  onChanged: (value) {
                    // store the value entered in the text field
                    ph = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              /*Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    _email = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Email ID',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),*/
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: TextField(
                  controller : controllerAdd1,
                  onChanged: (value) {
                    // store the value entered in the text field
                    add1 = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Office Address Line 1',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller : controllerAdd2,
                  onChanged: (value) {
                    // store the value entered in the text field
                    add2 = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Office Address Line 2',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),

              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Name Of NGO',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Phone Number',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Email id',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Office Address Line 1',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         height: 50,
              //         width: 300,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   floatingLabelAlignment: FloatingLabelAlignment.start,
              //                   hintText: 'Office Address Line 2',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 15.0,
            width: 15.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('Next'),
          onPressed: () {  

           
            //createUser(user);        
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NextNGOPage(name : ngoName)),
            );
          },
          
        ),
      ),
    );
    
    
    
  }
}
class NgoUser1 {
  String id;
  String name;
  final String phone;
  final String add1;
  final String add2;

  NgoUser1 ({
    this.id = '',
    this.name = '',
    this.phone = '',
    this.add1 = '',
    this.add2 = '',
  });

  Map<String, String> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'add1' : add1,
    'add2' : add2,
  };

  static NgoUser1 fromJson(Map<String, dynamic> json) => NgoUser1(
        id: json['id'],
        name : json['name'],
        phone : json['phone'],
        add1: json['add1'],
        add2: json['add2']
      );
}