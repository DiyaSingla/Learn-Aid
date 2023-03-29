import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_aid/registration_page.dart';
import 'mentor_dashboard.dart';
import 'ngo_dashboard.dart';
import 'signup.dart';

import 'reusable_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 43, 40, 41),
          Color.fromARGB(255, 105, 102, 103)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("images/learnaidlogo.jpeg"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              reusableTextField("Enter Username", Icons.person_outline, false,
                  _emailTextController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  checkCategory(_emailTextController.text);
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("${error.toString().split(']')[1]}")),
                  );
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption()
            ],
          ),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  void checkCategory(String email) async {
    List mentor = await searchMentorFromFirebase(email);
    print(mentor.toString());
    if (mentor.isEmpty == true) {
      List ngo = await searchNgoFromFirebase(email);
      if (ngo.isEmpty == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Please complete your registration first.")),
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                    body: RegistrationPage(email: _emailTextController.text))));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MentorSearchScreen()));
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NGOSearchScreen()));
    }
  }

  Future<List> searchMentorFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('MentorUsers')
        .where('email', isEqualTo: query)
        .get();
    List searchResult = [];
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
    return searchResult;
  }

  Future<List> searchNgoFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('NgoUsers')
        .where('email', isEqualTo: query)
        .get();
    List searchResult = [];
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
    return searchResult;
  }
}
