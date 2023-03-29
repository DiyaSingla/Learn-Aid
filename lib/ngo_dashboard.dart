import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_aid/about_us.dart';
import 'package:learn_aid/reusable_widget.dart';
import 'package:learn_aid/signin.dart';

import 'mentor_info.dart';

class MentorSearchScreen extends StatefulWidget {
  MentorSearchScreen({Key? key}) : super(key: key);

  @override
  State<MentorSearchScreen> createState() => MentorSearchScreenState();
}

class MentorSearchScreenState extends State<MentorSearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List searchResult = [];

  String? selectedClass = 'Class 1';

  final List<String> _section = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
  ];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('MentorUsers')
        .where('selectedSubject', isEqualTo: query)
        .where('selectedClass', isEqualTo: selectedClass)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("Your Dashboard"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.person_2_sharp),
              title: Text('View profile'),
              onTap: () {
                //Navigator.pop(context);
                // Navigate to home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline_sharp),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Text('\n'),
          const Text(
            "LIST OF MENTORS",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "Alkalami"),
          ),
          const Text('\n\n'),
          const Text(
            'Select Class:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          DropdownButton<String>(
            value: selectedClass,
            items: _section
                .map(
                  (sec) => DropdownMenuItem<String>(
                    child: Text(sec),
                    value: sec,
                  ),
                )
                .toList(),
            hint: const Text(
              'Select a class',
              style: TextStyle(color: Colors.white),
            ),
            onChanged: (newValue) {
              setState(() {
                selectedClass = newValue;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Here",
              ),
              onChanged: (query) {
                searchFromFirebase(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MentorInformation(
                                searchRecord: searchResult, index: index)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 95, 94, 94),
                            Colors.grey
                          ])),
                      child: searchMentor(
                          searchResult[index]['name'],
                          searchResult[index]['phone'],
                          searchResult[index]['selectedSubject'],
                          searchResult[index]['selectedClass']),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
