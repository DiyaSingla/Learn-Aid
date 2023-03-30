import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MentorInformation extends StatelessWidget {
  MentorInformation({Key? key, required this.searchRecord, required this.index})
      : super(key: key);
  final List<dynamic> searchRecord;
  final int index;

  @override
  Widget build(BuildContext context) {
    String name = searchRecord[index]['name'];
    String age = searchRecord[index]['age'];
    String ph = searchRecord[index]['phone'];
    String org = searchRecord[index]['organisation'];
    String email = searchRecord[index]['email'];
    String sub = searchRecord[index]['selectedSubject'];
    String cls = searchRecord[index]['selectedClass'];
    final size = MediaQuery.of(context).size;
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
            'NGO Information',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Name: ' + '$name',
                          textAlign: TextAlign.left,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Age :' + '$age',
                          textAlign: TextAlign.left,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Phone : ' + '$ph',
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Organisation: ' + '$org',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Class :' + '$cls',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Subject : ' + '$sub',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Email : ' + '$email',
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Phone',
            icon: Icon(Icons.phone),
          ),
          BottomNavigationBarItem(label: 'Email', icon: Icon(Icons.email)),
        ],
        onTap: (label) {},
      ),
    ));
  }
}
