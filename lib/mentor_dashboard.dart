import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_aid/reusable_widget.dart';

import 'ngo_info.dart';

class NGOSearchScreen extends StatefulWidget {
  NGOSearchScreen({Key? key}) : super(key: key);

  @override
  State<NGOSearchScreen> createState() => NGOSearchScreenState();
}

class NGOSearchScreenState extends State<NGOSearchScreen> {
  List searchResult = [];

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
        title: const Text("List of NGOs"),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                            builder: (context) => NGOInformation(
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
                      child: searchNGO(
                          searchResult[index]['name'],
                          searchResult[index]['phone'],
                          searchResult[index]['add1'],
                          searchResult[index]['add2']),
                    ));
                // return ListTile(
                //   title: Text(searchResult[index]['name']),
                //   subtitle: Text(searchResult[index]['add1']),
                //   trailing: Text(searchResult[index]['ph']),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => NGOInformation(
                //               searchRecord: searchResult, index: index)),
                //     );
              },
            ),
          ),
        ],
      ),
    );
  }
}
