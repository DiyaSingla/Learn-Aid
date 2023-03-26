import 'package:flutter/material.dart';
import 'package:learn_aid/activity_page.dart';
import 'registration_page.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Class:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 20),
              const Text(
                'Subjects:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 20),
              const Text(
                'Select your topic:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedTopic,
                items: _topics
                    .map(
                      (topic) => DropdownMenuItem<String>(
                        child: Text(
                          topic,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: topic,
                      ),
                    )
                    .toList(),
                hint: const Text(
                  'Select a topic',
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      selectedTopic = newValue;
                    },
                  );
                },
              ),
              CheckboxListTile(
                title: const Text(
                    'I hereby confirm that I will conduct the classes in an offline mode at the above chosen day, time and venue every week.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Alkalami",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
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
                          onPressed: () {
                            // Store the value when the button is pressed
                            /*inputButtonValue = 'some value';
                            print(
                                'Button pressed with input value: $inputButtonValue');*/
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
                                builder: (context) => ActivityPage(),
                              ),
                            );
                          },
                          child: const Text('Submit'),
                        )
                      : SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
