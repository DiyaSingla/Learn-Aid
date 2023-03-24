import 'package:flutter/material.dart';
import 'package:learn_aid/write_ngodata.dart';
import 'ngo_second_page.dart';
import 'ngo_first_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityPage extends StatelessWidget {

  Stream<List<WriteNgoData>> readUsers() => FirebaseFirestore.instance
      .collection('NgoUsers')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => WriteNgoData.fromJson(doc.data())).toList());

  Widget buildUser(WriteNgoData user) => ListTile(
    leading: CircleAvatar(child: Text(user.name)),
    title: Text(user.phone),
    subtitle: Text(user.add1),
  );
  //final NextNGOPage readstate = new NextNGOPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites Page"),
      ), 
      body: StreamBuilder<List<WriteNgoData>>(
        stream : readUsers(),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          }
          else if(snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(
              children: users.map(buildUser).toList(),
            );
          }
          else {
            return Center(child : CircularProgressIndicator());
          }
        },)
    );
  }
}
