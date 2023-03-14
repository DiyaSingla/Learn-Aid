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
          title: const Text('Registration Page'),
        ),
        body: Container(
          // padding: EdgeInsets.zero,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20), // Set button padding
                          minimumSize:
                              const Size(150, 50), // Set minimum button size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set rounded corner radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstPage()),
                          );
                        },
                        child: const Text(
                          'Register as NGO  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Alkalami",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 20), // Set button padding
                          minimumSize: Size(150, 50), // Set minimum button size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set rounded corner radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MentorFirstPage()),
                          );
                        },
                        child: const Text(
                          'Register as Mentor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Alkalami",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 20), // Set button padding
                          minimumSize: Size(150, 50), // Set minimum button size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set rounded corner radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonationPage()),
                          );
                        },
                        child: const Text(
                          'Donation Volunteer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Alkalami",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
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
