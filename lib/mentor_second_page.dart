import 'package:flutter/material.dart';
import 'registration_page.dart';

class NextMentorPage extends StatefulWidget {
  const NextMentorPage({Key? key}) : super(key: key);

  @override
  _NextMentorPageState createState() => _NextMentorPageState();
}

class _NextMentorPageState extends State<NextMentorPage> {
  String? _selectedClass;
  String? _selectedSubject;
  String? _selectedTopic;
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
                value: _selectedClass,
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
                    _selectedClass = newValue;
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
                value: _selectedSubject,
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
                    _selectedSubject = newValue;
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
                value: _selectedTopic,
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
                      _selectedTopic = newValue;
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
                            inputButtonValue = 'some value';
                            print(
                                'Button pressed with input value: $inputButtonValue');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
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
