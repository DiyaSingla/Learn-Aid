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

  void getAllData() async {
    final result =
        await FirebaseFirestore.instance.collection('MentorUsers').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }
  

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
        title: const Text("Your Dashboard"),
        backgroundColor: Color(0xff4a4a4a),
        automaticallyImplyLeading: false,
        actions: [
          Align(
            alignment: Alignment.centerLeft,
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "profile",
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("View Profile"),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: "about",
                  child: ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About Us"),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: "logout",
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ),
              ],
              onSelected: (String value) {
                switch (value) {
                  case "profile":
                    break;
                  case "about":
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                    break;
                  case "logout":
                    FirebaseAuth.instance.signOut().then(
                      (value) {
                        print("Signed Out");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                    );

                    break;
                }
              },
            ),
          ),
        ],
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
                  if (query.isEmpty == true) {
                    getAllData();
                  }
                  else {
                    searchFromFirebase(query);
                  }                 
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
                            searchRecord: searchResult,
                            index: index,
                          ),
                        ),
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
                        searchResult[index]['selectedClass'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
