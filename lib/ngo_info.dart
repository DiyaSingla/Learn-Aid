import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class NGOInformation extends StatefulWidget {
  NGOInformation({Key? key, required this.searchRecord, required this.index})
      : super(key: key);
  final List<dynamic> searchRecord;
  final int index;

  @override
  State<NGOInformation> createState() => _NGOInformationState();
}

class _NGOInformationState extends State<NGOInformation> {
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
    String add1 = widget.searchRecord[widget.index]['add1'];
    String add2 = widget.searchRecord[widget.index]['add2'];
    String ph = widget.searchRecord[widget.index]['phone'];
    String email = widget.searchRecord[widget.index]['email'];
    String c1 = widget.searchRecord[widget.index]['numcls1'];
    String c2 = widget.searchRecord[widget.index]['numcls2'];
    String c3 = widget.searchRecord[widget.index]['numcls3'];
    String c4 = widget.searchRecord[widget.index]['numcls4'];
    String c5 = widget.searchRecord[widget.index]['numcls5'];
    final size = MediaQuery.of(context).size;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(16)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          padding: EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            'Name: ' + '$name',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          padding: EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            'Address :' + '$add1' + ' ' + '$add2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          padding: EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            'Phone : ' + '$ph',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          padding: EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            'Email : ' + '$email',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 40, bottom: 175),
                      child: SizedBox(
                        height: 600,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 7)),
                              Text(
                                'Number of Children of:',
                                textAlign: TextAlign.right,
                              ),
                              Padding(padding: EdgeInsets.only(top: 35)),
                              Text(
                                'Class 1 : ' + '$c1',
                                textAlign: TextAlign.right,
                              ),
                              Padding(padding: EdgeInsets.only(top: 35)),
                              Text(
                                'Class 2 :' + '$c2',
                                textAlign: TextAlign.right,
                              ),
                              Padding(padding: EdgeInsets.only(top: 35)),
                              Text(
                                'Class 3 : ' + '$c3',
                                textAlign: TextAlign.right,
                              ),
                              Padding(padding: EdgeInsets.only(top: 35)),
                              Text(
                                'Class 4 : ' + '$c4',
                                textAlign: TextAlign.right,
                              ),
                              Padding(padding: EdgeInsets.only(top: 35)),
                              Text(
                                'Class 5: ' + '$c5',
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: 'Phone',
      //       icon: Icon(Icons.phone),
      //     ),
      //     BottomNavigationBarItem(label: 'Email', icon: Icon(Icons.email)),
      //   ],
      //   onTap: (label) {},
      // ),
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
    ));
  }
}
