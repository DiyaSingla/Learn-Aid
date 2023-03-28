import 'package:flutter/material.dart';
import 'package:learn_aid/activity_page.dart';
import 'ngo_dashboard.dart';
import 'registration_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'ngo_first_page.dart';
import 'write_ngodata.dart';

// use widget.variablename to access variable value in stateful widgets

class NextNGOPage extends StatefulWidget {
  String ID;

  NextNGOPage({super.key, required this.ID});
  @override
  State<NextNGOPage> createState() => NextNGOPageState();
}

class NextNGOPageState extends State<NextNGOPage> {
  WriteNgoData w = WriteNgoData(); // xyzilovejunk@gmail.com  //pizzapasta

  int _selectedValue = 0;
  String ncls1 = '';
  String ncls2 = '';
  String ncls3 = '';
  String ncls4 = '';
  String ncls5 = '';

  String hto = '';
  String hfrom = '';
  bool _ischecked = false;
  String? selectedClass;
  final List<String> _section = [
    'Saturday',
    'Sunday',
    'Both',
  ];
  Stream<List<NgoUser2>> readUsers() => FirebaseFirestore.instance
      .collection('NgoUser2')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => NgoUser2.fromJson(doc.data())).toList());
  /*Future createUser(WriteNgoData user)async {
      final docUser = FirebaseFirestore.instance.collection('NgoUsers').doc();
      final user = WriteNgoData(
        id : docUser.id,
        name : widget.name,
        phone : z.ph,
        add1 : z.add1,
        add2 : z.add2,
        numcls1 : ncls1,
        numcls2 : ncls2,
        numcls3 : ncls3,
        numcls4 : ncls4,
        numcls5 : ncls5,
        hrto : hto,
        hrfrom: hfrom,
        selectedClass : this.selectedClass,
      );
      final json = user.toJson();
      await docUser.set(json);
  } */

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
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Number Of Students Available"),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Class 1',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                ncls1 = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                 height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                          "                                                     "),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Class 2',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                ncls2 = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                          "                                                     "),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Class 3',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                ncls3 = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                          "                                                     "),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Class 4',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                ncls4 = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                          "                                                     "),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Class 5',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                ncls5 = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Select Days',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        hint: const Text('Select a day'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedClass = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Tutoring Hours"),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'From',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                hfrom = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("                             "),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'To',
                              hintStyle: TextStyle(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15)),
                          onChanged: (value) {
                            setState(
                              () {
                                hto = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CheckboxListTile(
                  title: const Text(
                      'We hereby confirm that we will provide all the resources to conduct the classes in an offline mode.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Alkalami",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  value: _ischecked,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        _ischecked = value!;
                      },
                    );
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
              ),
          ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 15.0,
              width: 15.0,
            ),
          ),
          floatingActionButton: _ischecked == true
              ? FloatingActionButton(
                  onPressed: () {
                    final docUser = FirebaseFirestore.instance
                        .collection('NgoUsers')
                        .doc(widget.ID);
                    docUser.update({
                      'numcls1': ncls1,
                      'numcls2': ncls2,
                      'numcls3': ncls3,
                      'numcls4': ncls4,
                      'numcls5': ncls5,
                      'hrto': hto,
                      'hrfrom': hfrom,
                      'selectedClass': selectedClass,
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirebaseSearchScreen()),
                    );
                  },
                  child: const Text('Submit'),
                )
              : SizedBox()),
      );
  }
}

class NgoUser2 {
  String id;
  String numcls1;
  String numcls2;
  String numcls3;
  String numcls4;
  String numcls5;
  String hrto;
  String hrfrom;
  String? selectedClass;

  NgoUser2({
    this.id = '',
    this.numcls1 = '',
    this.numcls2 = '',
    this.numcls3 = '',
    this.numcls4 = '',
    this.numcls5 = '',
    this.hrto = '',
    this.hrfrom = '',
    this.selectedClass = '',
  });

  Map<String, String> toJson() => {
        'id': id,
        'numcls1': numcls1,
        'numcls2': numcls2,
        'numcls3': numcls3,
        'numcls4': numcls4,
        'numcls5': numcls5,
        'hrto': hrto,
        'hrfrom': hrfrom,
        //'selectedClass' : selectedClass,
      };

  static NgoUser2 fromJson(Map<String, dynamic> json) => NgoUser2(
        id: json['id'],
        numcls1: json['numcls1'],
        numcls2: json['numcls2'],
        numcls3: json['numcls3'],
        numcls4: json['numcls4'],
        numcls5: json['numcls5'],
        hrto: json['hrto'],
        hrfrom: json['hrfrom'],
      );
}
