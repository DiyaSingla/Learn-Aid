import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_aid/reusable_widget.dart';
import 'package:learn_aid/signin.dart';
import 'package:learn_aid/about_us.dart';

import 'ngo_info.dart';

class NGOSearchScreen extends StatefulWidget {
  NGOSearchScreen({Key? key}) : super(key: key);

  @override
  State<NGOSearchScreen> createState() => NGOSearchScreenState();
}

class NGOSearchScreenState extends State<NGOSearchScreen> {
  List searchResult = [];

  void getAllData() async {
    final result = await FirebaseFirestore.instance.collection('NgoUsers').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('NgoUsers')
        .where('name', isEqualTo: query)
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
        backgroundColor: Colors.blueGrey,
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
              "LIST OF NGOs",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "Alakalami"),
            ),
            const Text('\n\n'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search NGO by Zone",
                ),
                onChanged: (query) {
                  if (query.isEmpty) {
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
                              builder: (context) => NGOInformation(
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
                        child: searchNGO(
                            searchResult[index]['name'],
                            searchResult[index]['phone'],
                            searchResult[index]['add1'],
                            searchResult[index]['add2']),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
