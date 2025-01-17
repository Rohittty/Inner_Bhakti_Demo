import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/verification_screen.dart';

class SignupStartScreen extends StatelessWidget {
  const SignupStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height:
                    screenHeight * 0.05), // Adjust space from top dynamically
            // Top Buddha Icon (moved slightly towards center)
            Container(
              height: screenWidth * 0.5, // Adjust size based on screen width
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/buddhaicon.png',
                  height: screenWidth * 0.4, // Adjust icon size dynamically
                  width: screenWidth * 0.4,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            // Card Section (Dialog box moved upwards and horizontally)
            Align(
              alignment: Alignment(0.0, -0.3), // Move the card upwards a bit
              child: Container(
                height: screenHeight * 0.6, // Adjust height dynamically
                width: screenWidth * 0.9, // Slightly wider
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05), // Adjust horizontally
                padding: EdgeInsets.all(
                    screenWidth * 0.1), // Adjust padding dynamically
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
                  children: [
                    // Om Symbol
                    Image.asset('assets/om.png'),
                    SizedBox(height: screenHeight * 0.02),
                    // Text Content
                    Text(
                      "Discover the power of\nMantras, Japas and\nHindu Saadhana",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            screenWidth * 0.05, // Adjust font size dynamically
                        fontWeight: FontWeight.w500,
                        color: Colors.orange.shade800,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Buttons (expanded)
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the VerificationScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        minimumSize: Size(double.infinity,
                            screenHeight * 0.08), // Expanded width and height
                      ),
                      child: Text(
                        "Continue with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth *
                              0.04, // Adjust font size dynamically
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the VerificationScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        minimumSize: Size(double.infinity,
                            screenHeight * 0.08), // Expanded width and height
                      ),
                      child: Text(
                        "Continue with Apple",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth *
                              0.04, // Adjust font size dynamically
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
