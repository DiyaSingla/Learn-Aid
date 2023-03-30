import 'package:flutter/material.dart';
import 'package:learn_aid/ngo_info.dart';

import 'mentor_info.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key, required this.list, required this.type});
  final List<dynamic> list;
  final int type;

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  Widget build(BuildContext context) {
    if (widget.type == 1) {
      String name = widget.list[0]['name'];
      String add1 = widget.list[0]['add1'];
      String add2 = widget.list[0]['add2'];
      String ph = widget.list[0]['phone'];
      String email = widget.list[0]['email'];
      String c1 = widget.list[0]['numcls1'];
      String c2 = widget.list[0]['numcls2'];
      String c3 = widget.list[0]['numcls3'];
      String c4 = widget.list[0]['numcls4'];
      String c5 = widget.list[0]['numcls5'];
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
              'Your Profile',
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
                                color: Colors.grey,
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
      ));
    } else {
      String name = widget.list[0]['name'];
      String age = widget.list[0]['age'];
      String ph = widget.list[0]['phone'];
      String org = widget.list[0]['organisation'];
      String email = widget.list[0]['email'];
      String sub = widget.list[0]['selectedSubject'];
      String cls = widget.list[0]['selectedClass'];
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
      ));
    }
    // checkType(widget.list, widget.type);
    // return SafeArea(
    //     child: Scaffold(
    //   appBar: AppBar(
    //       title: Text(
    //     "Your Profile",
    //   )),
    // ));
  }

  // void checkType(List list, int type) {
  //   if (type == 1) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 NGOInformation(searchRecord: list, index: 0)));
  //   } else {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 MentorInformation(searchRecord: list, index: 0)));
  //   }
  // }
}
