import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorInformation extends StatefulWidget {
  MentorInformation({Key? key, required this.searchRecord, required this.index})
      : super(key: key);
  final List<dynamic> searchRecord;
  final int index;

  @override
  State<MentorInformation> createState() => _MentorInformationState();
}

class _MentorInformationState extends State<MentorInformation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Phone'),
    Text('Email'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Hello");
    switch (index) {
      case 0:
        launch('tel:+${widget.searchRecord[widget.index]['phone']}');
        break;
      case 1:
        launch('mailto:${widget.searchRecord[widget.index]['email']}');

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.searchRecord[widget.index]['name'];
    String age = widget.searchRecord[widget.index]['age'];
    String ph = widget.searchRecord[widget.index]['phone'];
    String org = widget.searchRecord[widget.index]['organisation'];
    String email = widget.searchRecord[widget.index]['email'];
    String sub = widget.searchRecord[widget.index]['selectedSubject'];
    String cls = widget.searchRecord[widget.index]['selectedClass'];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6d4c41),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Mentor Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Alkalami",
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text('Name: $name'),
                SizedBox(height: 40),
                Text('Age: $age'),
                SizedBox(height: 40),
                Text('Phone: $ph'),
                SizedBox(height: 40),
                Text('Organisation: $org'),
                SizedBox(height: 40),
                Text('Class: $cls'),
                SizedBox(height: 40),
                Text('Subject: $sub'),
                SizedBox(height: 40),
                Text('Email: $email'),
              ],
            ),
          ),
        ),
      ),

      // Widget build(BuildContext context) {
      //   String name = widget.searchRecord[widget.index]['name'];
      //   String age = widget.searchRecord[widget.index]['age'];
      //   String ph = widget.searchRecord[widget.index]['phone'];
      //   String org = widget.searchRecord[widget.index]['organisation'];
      //   String email = widget.searchRecord[widget.index]['email'];
      //   String sub = widget.searchRecord[widget.index]['selectedSubject'];
      //   String cls = widget.searchRecord[widget.index]['selectedClass'];
      //   final size = MediaQuery.of(context).size;
      //   return SafeArea(
      //       child: Scaffold(
      //     backgroundColor: const Color(0xFFA1D2CE),
      //     appBar: AppBar(
      //       // backgroundColor: const Color(0xFF62A8AC),
      //       backgroundColor:  Color(0xff6d4c41),
      //       centerTitle: true,
      //       title: const Padding(
      //         padding: EdgeInsets.all(5.0),
      //         child: Text(
      //           'Mentor Information',
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontFamily: "Alkalami",
      //             fontSize: 25,
      //           ),
      //         ),
      //       ),
      //     ),
      //     body: Container(
      //       constraints: const BoxConstraints.expand(),
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('images/background.jpg'),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Flexible(
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Expanded(
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Name: ' + '$name',
      //                         textAlign: TextAlign.left,
      //                       ),
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Age :' + '$age',
      //                         textAlign: TextAlign.left,
      //                       ),
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Phone : ' + '$ph',
      //                         textAlign: TextAlign.left,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Organisation: ' + '$org',
      //                         textAlign: TextAlign.right,
      //                       ),
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Class :' + '$cls',
      //                         textAlign: TextAlign.right,
      //                       ),
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Subject : ' + '$sub',
      //                         textAlign: TextAlign.right,
      //                       ),
      //                       Padding(padding: EdgeInsets.only(top: 40)),
      //                       Text(
      //                         'Email : ' + '$email',
      //                         textAlign: TextAlign.right,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Phone',
            icon: Icon(Icons.phone),
          ),
          BottomNavigationBarItem(label: 'Email', icon: Icon(Icons.email)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
