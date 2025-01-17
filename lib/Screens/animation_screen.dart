import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/animation_screen2.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next page after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Get.off(() => const NextPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0.0, -0.5),
            radius: 0.9,
            colors: [
              Colors.orange.shade100,
              Colors.white,
            ],
          ),
          image: const DecorationImage(
            image: AssetImage("assets/Burst.png"), // Your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: screenHeight * 0.53,
              left: screenWidth * 0.41,
              child: Image.asset("assets/circle.png"),
            ),
            Positioned(
              bottom: screenHeight * 0.45,
              left: screenWidth * 0.27,
              child: Text(
                'InnerBhakti',
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
