import 'package:flutter/material.dart';
import 'registration_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'ngo_first_page.dart';
import 'write_ngodata.dart';



class NextNGOPage extends StatefulWidget {
  String name;
  
  NextNGOPage({super.key,required this.name});
  @override
  State<NextNGOPage> createState() => NextNGOPageState(this.name);
}

class NextNGOPageState extends State<NextNGOPage> {
  
  NextNGOPageState(String n) {
    this.name = n;
  }
  late String name;
  FirstPageState z = FirstPageState();
  //NextNGOPage w = NextNGOPage();
  //WriteNgoData w = new WriteNgoData();   // xyzilovejunk@gmail.com  //pizzapasta

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
  Future createUser(WriteNgoData user)async {
      final docUser = FirebaseFirestore.instance.collection('NgoUsers').doc();
      final user = WriteNgoData(
        id : docUser.id,
        name : name,
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
  }  

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
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                  height: 3,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                  height: 3,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                  height: 3,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                  height: 3,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 400,
                  height: 50,
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
                              contentPadding: EdgeInsets.all(10)),
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
                const SizedBox(
                  height: 10,
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
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 15.0,
              width: 15.0,
            ),
          ),
          floatingActionButton: _ischecked == true
              ? FloatingActionButton(
                  onPressed: () {
                    final user = WriteNgoData(
                      name : z.ngoName,
                      phone : z.ph,
                      add1 : z.add1,
                      add2 : z.add2,
                      numcls1: ncls1,
                      numcls2: ncls2,
                      numcls3: ncls3,
                      numcls4: ncls4,
                      numcls5: ncls5,
                      hrto: hto,
                      hrfrom: hfrom,
                      //selectedClass: _selectedClass,
                    );
                    createUser(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationPage()),
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
