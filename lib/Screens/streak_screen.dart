import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/feeling_dialog_screen.dart';
import 'package:get/get.dart';

class FeelingSplashScreen extends StatefulWidget {
  const FeelingSplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeelingSplashScreenState createState() => _FeelingSplashScreenState();
}

class _FeelingSplashScreenState extends State<FeelingSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after a delay
    Future.delayed(Duration(seconds: 3), () {
      Get.off(FeelingScreen(
        isContinueButtonEnabled: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/backki.jpg'))),
          ),
          // Centered Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title

              Spacer(),
              // Bottom Daily Streak Card
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Streak Title
                      Image.asset('assets/circle.png'),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "You are on\na daily streak",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "Good work! Be consistent\nfor better results",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // Streak Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(7, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CircleAvatar(
                              radius: screenWidth * 0.03,
                              backgroundColor: index == 0
                                  ? Color(0xFFFF7A00)
                                  : Colors.orange[200],
                              child: index == 0
                                  ? Icon(Icons.check,
                                      size: screenWidth * 0.04,
                                      color: Colors.white)
                                  : null,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
