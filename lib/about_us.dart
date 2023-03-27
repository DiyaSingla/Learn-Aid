import 'package:flutter/material.dart';
import 'package:learn_aid/activity_page.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'registration_page.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Contact Us',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Text(
                'Here is how you can contact us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    InkWell(
                      child: Row(
                        children: const [
                          Icon(Icons.phone),
                          SizedBox(width: 10),
                          Text(
                            '123-456-7890',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      onTap: () => launch('tel:+1234567890'),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    InkWell(
                      child: Row(
                        children: const [
                          Icon(Icons.email),
                          SizedBox(height: 10),
                          Text(
                            'info@example.com',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      onTap: () =>
                          launch('mailto:info@example.com?subject=Contact'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Text(
                'We did this for GSC.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/anushka.jpeg'),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Text('Anushka Singh, CSE-AI (IGDTUW)'),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/arushi.jpeg'),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Text('Arushi Sinha, ECE-AI (IGDTUW)'),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/diya.jpeg'),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Text('Diya Singla, CSE-AI (IGDTUW)'),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/nidhi.jpeg'),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Text('Nidhi Bhatt, CSE (IGDTUW)'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Store the value when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityPage(),
                      ),
                    );
                  },
                  child: const Text('GO BACK'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
