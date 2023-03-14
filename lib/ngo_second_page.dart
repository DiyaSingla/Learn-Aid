import 'package:flutter/material.dart';
import 'registration_page.dart';

class NextNGOPage extends StatefulWidget {
  const NextNGOPage({super.key});

  @override
  State<NextNGOPage> createState() => _NextNGOPageState();
}

class _NextNGOPageState extends State<NextNGOPage> {
  int _selectedValue = 0;
  String _numcls1 = '';
  String _numcls2 = '';
  String _numcls3 = '';
  String _numcls4 = '';
  String _numcls5 = '';

  String _hrto = '';
  String _hrfrom = '';
  bool _ischecked = false;
  String? _selectedClass;
  final List<String> _section = [
    'Saturday',
    'Sunday',
    'Both',
  ];

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
                                _numcls1 = value;
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
                                _numcls2 = value;
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
                                _numcls3 = value;
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
                                _numcls4 = value;
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
                                _numcls5 = value;
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
                        value: _selectedClass,
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
                            _selectedClass = newValue;
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
                                _hrfrom = value;
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
                                _hrto = value;
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
