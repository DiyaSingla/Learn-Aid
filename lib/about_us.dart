import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6d4c41),
        title: Text('Contact Us'),
        centerTitle: true,
      ),
      body: Container(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Text(
                'Reach out to us by -',
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
                    color: Colors.black,
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
                'We are excited to share with you our project, Learn Aid, which we have developed as a part of the Google Solution Challenge 2023. As four second-year B.Tech undergraduates from IGDTUW, we have utilized our skills in Flutter, Dart, and Firebase to create an app that connects mentors to NGOs, making teaching children easier.'
                'Our main aim is to promote sustainable development goals focused on education and reducing inequality. With Learn Aid, we hope to create a platform that bridges the gap between mentors and underprivileged children, providing them with quality education and equal opportunities.'
                'We believe that our project has the potential to make a significant impact, and we are committed to contributing towards a better future. Thank you for considering our project, and we look forward to hearing from you.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/anushka.jpeg'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text('Anushka Singh, CSE-AI (IGDTUW)'),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/arushi.jpeg'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Text('Arushi Sinha, ECE-AI (IGDTUW)'),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/diya.jpeg'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text('Diya Singla, CSE-AI (IGDTUW)'),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/nidhi.jpeg'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Text('Nidhi Bhatt, CSE (IGDTUW)'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
