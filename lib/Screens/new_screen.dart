import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/name_input_screen.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.5),
            radius: 0.9,
            colors: [
              Colors.orange.shade100,
              Colors.white,
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/Burst.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Circle positioning using responsive design
            Positioned(
              bottom:
                  screenHeight * 0.28, // Bottom position based on screen height
              left: screenWidth *
                  0.18, // Horizontal positioning based on screen width
              child: Container(
                height: screenHeight *
                    0.6, // Circle height responsive to screen size
                width:
                    screenWidth * 0.6, // Circle width responsive to screen size
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Buddha icon positioning using responsive design
            Positioned(
                bottom: screenHeight * 0.5 -
                    77, // Adjusted bottom based on screen height
                left: screenWidth * 0.5 -
                    108, // Centered horizontally based on screen width
                child: Image.asset(
                  'assets/buddhaicon.png',
                  width: 200,
                )),
            // Main content container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(
                    screenHeight * 0.05), // Padding relative to screen height
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text content with responsive font size
                    Text(
                      "Discover inner peace: Personalized solutions inspired by Hindu Dharma",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth *
                            0.05, // Font size relative to screen width
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Button with responsive width
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiPageForm(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      child: SizedBox(
                        width: screenWidth *
                            0.8, // Button width responsive to screen width
                        child: Center(
                          child: const Text(
                            "Start Feeling Better",
                            style: TextStyle(fontSize: 16, color: Colors.white),
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
      ),
    );
  }
}
