import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/om_audio_screen.dart';

class JaapScreen extends StatelessWidget {
  const JaapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            // Row containing the back arrow button and progress bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Handle back navigation
                    },
                  ),
                  SizedBox(width: width * 0.02),
                  // Progress bar
                  Expanded(
                    child: Container(
                      height: 6, // Progress bar height
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Background color
                        borderRadius:
                            BorderRadius.circular(12), // Curved corners
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(12), // Clip for smooth curves
                        child: LinearProgressIndicator(
                          value: 0.3, // Example progress value
                          color: Colors.black, // Progress color
                          backgroundColor:
                              Colors.transparent, // Transparent background
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.07),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Feel instantly better with",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "this recommended Jaap",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Center(
                        child: Column(
                          children: [
                            // Central image with progress bar
                            GestureDetector(
                              onTap: () {
                                Get.to(OmAudioScreen());
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      'assets/omaudio.png', // Replace with your asset path
                                      width: width * 1.0,
                                      height: width * 1.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    top: 16,
                                    right: 16,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "02:30 min",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 16,
                                    left: 16,
                                    child: Text(
                                      "Gayatri Mantra",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -20,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: width * 0.7,
                                          child: LinearProgressIndicator(
                                            value:
                                                0.5, // Example progress value
                                            backgroundColor: Colors.grey[300],
                                            color: Colors.orange,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.05),
                            // Play button with Lingkaran background
                            Container(
                              height: height * 0.20,
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    bottom: 12,
                                    right: 105,
                                    child: Opacity(
                                      opacity: 0.3,
                                      child: Image.asset(
                                        'assets/Lingkaran.png', // Replace with your asset path
                                        width: width * 0.4,
                                        height: width * 0.4,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 50,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(OmAudioScreen());
                                      },
                                      child: CircleAvatar(
                                        radius: width * 0.08,
                                        backgroundColor: Colors.orange,
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: width * 0.08,
                                        ),
                                      ),
                                    ),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
