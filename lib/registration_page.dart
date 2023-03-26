
import 'package:flutter/material.dart';
import 'activity_page.dart';
import 'about_us.dart';
import 'mentor_first_page.dart';
import 'donation_page.dart';
import 'ngo_first_page.dart';
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Your activity'),
    Text('About Us'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Hello");
    switch (index) {
      case 0:
        // Navigate to Home Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationPage()),
        );
        break;
      case 1:
        // Navigate to Favorites Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityPage()),
        );
        break;
      case 2:
        // Navigate to Profile Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutUs()),
        );
        break;
    }
  }

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
                                  builder: (context) => FirstPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Ink.image(
                                image: const NetworkImage(
                                    'https://danamojo.org/site/wp-content/uploads/2016/04/ngo-building.png'),
                                // height: 200,
                                // width: 200,
                                height: MediaQuery.of(context).size.height * 0.25,
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
                                  builder: (context) => MentorFirstPage()),
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

                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.0),
                  //   child: Center(
                  //     child: Container(
                  //       margin: const EdgeInsets.all(10.0),
                  //       alignment: Alignment.center,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 25,
                  //               vertical: 20), // Set button padding
                  //           minimumSize: Size(150, 50), // Set minimum button size
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(
                  //                 10), // Set rounded corner radius
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => DonationPage()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'Donation Volunteer',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontFamily: "Alkalami",
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios_outlined),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "About Us",
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}