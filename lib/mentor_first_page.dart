import 'package:flutter/material.dart';
import 'package:learn_aid/write_ngodata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mentor_second_page.dart';

class MentorFirstPage extends StatefulWidget {
  const MentorFirstPage({super.key, required this.email});
  final String email;

  @override
  State<MentorFirstPage> createState() => _MentorFirstPageState();
}

class _MentorFirstPageState extends State<MentorFirstPage> {
  WriteMentorData m = WriteMentorData();
  int selectedValue = 0;
  String org = '';
  String name = '';
  String age = '';
  String ph = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFA1D2CE),
      appBar: AppBar(
        // backgroundColor: const Color(0xFF62A8AC),
        backgroundColor:  Color(0xff6d4c41),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'Mentor Registration',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'images/mentorfirstpage.png',
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Alkalami",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // store the value entered in the text field
                      setState(() {
                        name = value;
                      });
                      // name = value;
                    },
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.002,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // store the value entered in the text field
                      setState(() {
                        age = value;
                      });
                      // age = value;
                    },
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Age',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.002,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        ph = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Your Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.002,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Are you a college student?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Alkalami",
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = 0;
                              });
                            },
                          ),
                          const Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Alkalami",
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = 1;
                              });
                            },
                          ),
                          const Text(
                            "No",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Alkalami",
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // store the value entered in the text field
                      setState(() {
                        org = value;
                      });
                      // org = value;
                    },
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Organisation',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      launch('https://myaadhaar.uidai.gov.in/verifyAadhaar');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text('Verify Your Aadhar Details Here', style: TextStyle(color: Colors.black),),
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
          height: MediaQuery.of(context).size.height * 0.02,
          width: MediaQuery.of(context).size.width * 0.06,
        ),
      ),
      floatingActionButton:
          ph.isNotEmpty && name.isNotEmpty && age.isNotEmpty && org.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    final user = WriteMentorData(
                      name: name,
                      age: age,
                      ph: ph,
                      collegeStudent: selectedValue,
                      org: org,
                      selectedClass: '',
                      selectedSubject: '',
                      selectedTopic: '',
                      email: widget.email,
                    );
                    m.createUserMentor(user);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextMentorPage(Id: m.id),
                      ),
                    );
                  },
                  backgroundColor:  Color(0xff6d4c41),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : null,
    ));
  }
}
