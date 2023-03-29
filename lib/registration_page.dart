import 'package:flutter/material.dart';
import 'mentor_first_page.dart';
import 'ngo_first_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.email});
  
  final String email;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Button',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff4a4a4a),
          title: Text('Registration Page'),
        ),
        body: Container(
          // padding: EdgeInsets.zero,
          constraints: const BoxConstraints.expand(),
          color: Colors.black87,
          // decoration: const BoxDecoration(
          //   // image: DecorationImage(
          //   //   //image: AssetImage('images/background.jpg'),
          //   //   fit: BoxFit.cover,
          //   // ),
          // ),

          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  1, MediaQuery.of(context).size.height * 0.1, 1, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Center(
                      child: Material(
                        color: Colors.white10,
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FirstPage(email: widget.email)),
                            );
                          },
                          child: Column(
                            children: [
                              Ink.image(
                                // image: NetworkImage(
                                //     'https://danamojo.org/site/wp-content/uploads/2016/04/ngo-building.png'),
                                // height: 200,
                                // width: 200,
                                image:AssetImage(
                                  'images/registrationpage.png'),
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                width: MediaQuery.of(context).size.width * 0.50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Register as NGO',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Material(
                        color: Colors.white10,
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MentorFirstPage(email: widget.email)),
                            );
                          },
                          child: Column(
                            children: [
                              Ink.image(
                                image: const NetworkImage(
                                    'https://d22bbllmj4tvv8.cloudfront.net/d5/c0/efaeb96d41e3a674f8d2ed576bed/what-is-mentoring1-square.jpg'),
                                // height: 200,
                                // width: 200,
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.50,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              const Text(
                                'Register as Mentor',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
