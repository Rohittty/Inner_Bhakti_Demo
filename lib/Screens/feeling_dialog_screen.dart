import 'package:flutter/material.dart';

import 'package:inner_bhakti_demo/Screens/mainpage_screen.dart';
import 'package:inner_bhakti_demo/Screens/signup_start_screen.dart';
import 'package:get/get.dart';
// Replace with the screen you want to navigate to when the boolean is false

class FeelingScreen extends StatefulWidget {
  final bool isContinueButtonEnabled; // Boolean parameter

  const FeelingScreen({super.key, required this.isContinueButtonEnabled});

  @override
  // ignore: library_private_types_in_public_api
  _FeelingScreenState createState() => _FeelingScreenState();
}

class _FeelingScreenState extends State<FeelingScreen> {
  String _selectedFeeling = ""; // To track the selected feeling

  @override
  Widget build(BuildContext context) {
    // Getting screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/backki.jpg"), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom Dialog Box
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.6, // Adjust height dynamically
              width: screenWidth * 0.9, // Adjust width dynamically
              margin: EdgeInsets.only(
                  bottom: screenHeight * 0.05), // Slightly above the bottom
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        screenWidth * 0.07), // Adjust padding dynamically
                    child: Column(
                      children: [
                        // Title
                        Text(
                          "How do you feel now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth *
                                0.06, // Adjust font size dynamically
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        // Subtitle
                        Text(
                          "Did the session help?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth *
                                0.05, // Adjust font size dynamically
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        // Feeling Options
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Neutral
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedFeeling = "Neutral";
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.sentiment_neutral,
                                    size: screenWidth * 0.1, // Adjust icon size
                                    color: _selectedFeeling == "Neutral"
                                        ? Colors.red
                                        : Colors.grey[700],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Neutral",
                                    style: TextStyle(
                                      fontSize: screenWidth *
                                          0.04, // Adjust text size
                                      color: _selectedFeeling == "Neutral"
                                          ? Colors.red
                                          : Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Yes
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedFeeling = "Yes";
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: screenWidth * 0.1, // Adjust icon size
                                    color: _selectedFeeling == "Yes"
                                        ? Colors.red
                                        : Colors.grey[700],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontSize: screenWidth *
                                          0.04, // Adjust text size
                                      color: _selectedFeeling == "Yes"
                                          ? Colors.red
                                          : Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // No
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedFeeling = "No";
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.sentiment_dissatisfied,
                                    size: screenWidth * 0.1, // Adjust icon size
                                    color: _selectedFeeling == "No"
                                        ? Colors.red
                                        : Colors.grey[700],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "No",
                                    style: TextStyle(
                                      fontSize: screenWidth *
                                          0.04, // Adjust text size
                                      color: _selectedFeeling == "No"
                                          ? Colors.red
                                          : Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Continue Button
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: screenHeight * 0.05), // Slightly above bottom
                    child: ElevatedButton(
                      onPressed: () {
                        // Check the boolean value and navigate accordingly
                        if (widget.isContinueButtonEnabled) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupStartScreen(),
                            ),
                          );
                        } else {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         MainPage(), // Replace with your desired screen
                          //   ),
                          // );
                          Get.offAll(MainPage());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF7A00),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                screenWidth * 0.1, // Adjust padding dynamically
                            vertical: screenHeight *
                                0.02), // Adjust padding dynamically
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Continue to app",
                        style: TextStyle(
                          fontSize: screenWidth *
                              0.04, // Adjust font size dynamically
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
