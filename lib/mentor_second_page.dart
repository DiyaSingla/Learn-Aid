import 'package:flutter/material.dart';
import 'mentor_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NextMentorPage extends StatefulWidget {
  const NextMentorPage({Key? key, required this.Id}) : super(key: key);
  final String Id;
  @override
  _NextMentorPageState createState() => _NextMentorPageState();
}

class _NextMentorPageState extends State<NextMentorPage> {
  String? selectedClass;
  String? selectedSubject;
  String? selectedTopic;
  bool _isChecked = false;
  String inputButtonValue = '';

  final List<String> _section = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
  ];

  final List<String> _subjects = [
    'English',
    'Hindi',
    'Maths',
    'Science',
    'SST',
  ];

  final List<String> _topics = [
    'Literature',
    'Grammar',
    'Theory',
    'Practical',
    'Case Study',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA1D2CE),
      appBar: AppBar(
        backgroundColor: Color(0xff4a4a4a),
        title: const Text('Mentoring Information'),
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Classes:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              'Select a class',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text(
                    'Subjects:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              'Select a subject',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedSubject,
                          items: _subjects
                              .map(
                                (subject) => DropdownMenuItem<String>(
                                  child: Text(subject),
                                  value: subject,
                                ),
                              )
                              .toList(),
                          hint: const Text(
                            'Select a subject',
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              selectedSubject = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text(
                    'Topics:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              'Select a topic',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedTopic,
                          items: _topics
                              .map(
                                (topic) => DropdownMenuItem<String>(
                                  child: Text(topic),
                                  value: topic,
                                ),
                              )
                              .toList(),
                          hint: const Text(
                            'Select a topic',
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              selectedTopic = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  CheckboxListTile(
                    title: const Text(
                      'I hereby confirm that I will conduct the classes in an offline mode at the above chosen day and time every week.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Alkalami",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          _isChecked = value!;
                        },
                      );
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Center(
                      child: _isChecked == true
                          ? ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff4a4a4a)),
                              ),
                              onPressed: () {
                                // Store the value when the button is pressed
                                final docUser = FirebaseFirestore.instance
                                    .collection('MentorUsers')
                                    .doc(widget.Id);
                                docUser.update({
                                  'selectedClass': selectedClass,
                                  'selectedSubject': selectedSubject,
                                  'selectedTopic': selectedTopic,
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NGOSearchScreen(),
                                  ),
                                );
                              },
                              child: const Text('Submit'),
                            )
                          : SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
