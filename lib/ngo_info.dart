import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NGOInformation extends StatelessWidget {
  NGOInformation({Key? key, required this.searchRecord, required this.index})
      : super(key: key);
  final List<dynamic> searchRecord;
  final int index;

  @override
  Widget build(BuildContext context) {
    String name = searchRecord[index]['name'];
    String add1 = searchRecord[index]['add1'];
    String add2 = searchRecord[index]['add2'];
    String ph = searchRecord[index]['phone'];
    String email = searchRecord[index]['email'];
    String c1 = searchRecord[index]['numcls1'];
    String c2 = searchRecord[index]['numcls2'];
    String c3 = searchRecord[index]['numcls3'];
    String c4 = searchRecord[index]['numcls4'];
    String c5 = searchRecord[index]['numcls5'];
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
            'Mentor Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Alkalami",
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Column(
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
                        'Address :' + '$add1' + '\n' + '$add2',
                        textAlign: TextAlign.left,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Phone : ' + '$ph',
                        textAlign: TextAlign.left,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Email : ' + '$email',
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
                        'Number of Children of:',
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Class 1 : ' + '$c1',
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Class 2 :' + '$c2',
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Class 3 : ' + '$c3',
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Class 4 : ' + '$c4',
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Class 5: ' + '$c5',
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
