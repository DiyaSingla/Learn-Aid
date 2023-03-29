import 'package:flutter/material.dart';
import 'registration_page.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  List<String> selectedItems = [];

  final List<String> cities = [
    'Delhi',
    'Mumbai',
    'Kolkata',
    'Chennai',
    'Bangalore',
  ];

  String? selectedCity;
  String? booksandstationary;
  bool buttonTextBooks = false;
  bool buttonTextStationary = false;
  bool buttonTextFunds = false;

  void _updateButtonBooks() {
    setState(() {
      buttonTextBooks = true;
    });
  }

  void _updateButtonStationary() {
    setState(() {
      buttonTextStationary = true;
    });
  }

  void _updateButtonFunds() {
    setState(() {
      buttonTextFunds = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Donate Now!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  const Image(
                    image: NetworkImage(
                        "https://thumbs.dreamstime.com/b/box-school-office-supplies-sign-bright-blue-background-donation-concept-various-121751259.jpg"),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: _updateButtonBooks,
                        child: const Text('Books And Stationaries'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 150,
                          child: buttonTextBooks == true
                              ? TextField(
                                  onChanged: (value) {
                                    // store the value entered in the text field
                                    booksandstationary = value;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Your Address',
                                    // border: InputBorder.none,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox()),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: _updateButtonFunds,
                        child: const Text('Funds'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButton(
                    value: selectedCity,
                    hint: const Text(
                      'Select Your City',
                      style: TextStyle(color: Colors.black),
                    ),
                    items: cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(
                          city,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
