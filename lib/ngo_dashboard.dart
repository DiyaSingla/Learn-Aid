import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_aid/reusable_widget.dart';

import 'mentor_info.dart';


class MentorSearchScreen extends StatefulWidget {
  MentorSearchScreen({Key? key}) : super(key: key);

  @override
  State<MentorSearchScreen> createState() => MentorSearchScreenState();
}

class MentorSearchScreenState extends State<MentorSearchScreen> {
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
        title: const Text("List of Mentors"),
      ),
      body: Column(
        children: [
          Text(
            'Select Class:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
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
              decoration: InputDecoration(
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
                          gradient: LinearGradient(colors: [
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
