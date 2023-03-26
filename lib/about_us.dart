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
              SizedBox(height: 20),
              const Text(
                'Here is how you can contact us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    InkWell(
                      child: Row(
                        children: const [
                          Icon(Icons.email),
                          SizedBox(width: 10),
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
              const SizedBox(height: 20),
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'We did this for GSC.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(
                              'https://via.placeholder.com/200x200.png?text=Image+1'),
                          SizedBox(height: 10),
                          Text('Image 1'),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(
                              'https://via.placeholder.com/200x200.png?text=Image+2'),
                          SizedBox(height: 10),
                          Text('Image 2'),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(
                              'https://via.placeholder.com/200x200.png?text=Image+3'),
                          const SizedBox(height: 10),
                          const Text('Image 3'),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(
                              'https://via.placeholder.com/200x200.png?text=Image+4'),
                          const SizedBox(height: 10),
                          const Text('Image 4'),
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
                        builder: (context) => RegistrationPage(),
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

