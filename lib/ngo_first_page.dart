import 'package:flutter/material.dart';
import 'ngo_second_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email="", password="";
  int _selectedValue = 0;
  String _ngoName = '';
  String _phone = '';
  String _email = '';
  String _add1 = '';
  String _add2 = '';
 
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
              //Starting from here
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    _ngoName = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Name of NGO',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    _phone = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    _email = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Email ID',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    _add1 = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Office Address Line 1',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    // store the value entered in the text field
                    _add2 = value;
                  },
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Office Address Line 2',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),

              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Name Of NGO',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Phone Number',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Email id',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         width: 300,
              //         height: 50,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   hintText: 'Office Address Line 1',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         height: 50,
              //         width: 300,
              //         padding: const EdgeInsets.all(2.0),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.white.withOpacity(0.3),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: TextField(
              //                 decoration: InputDecoration(
              //                   floatingLabelAlignment: FloatingLabelAlignment.start,
              //                   hintText: 'Office Address Line 2',
              //                   hintStyle: TextStyle(
              //                     color: Colors.white.withOpacity(0.8),
              //                   ),
              //                   border: InputBorder.none,
              //                   contentPadding: EdgeInsets.all(10),
              //                 ),
              //                 onChanged: (value) {
              //                   setState(
              //                     () {
              //                       _cardNumber = value;
              //                     },
              //                   );
              //                 },
              //               ),
              //             ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 15.0,
            width: 15.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NextNGOPage()),
            );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}